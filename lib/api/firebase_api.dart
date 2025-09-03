import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
    // Handle background message
    print("Notif Title: ${message.notification?.title}");
    print("Notif Body: ${message.notification?.body}");
    print("Notif Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Define the Android Notification Channel
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance,
  );

  // Initialize the FlutterLocalNotificationsPlugin
  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleNotif(RemoteMessage? message) {
    if (message == null) return;

    // Try to get route from notification data / payload
    String route = '/';
    
    // Fallback: check title/body for route keywords
    final title = message.notification?.title?.toLowerCase() ?? '';
    final body = message.notification?.body?.toLowerCase() ?? '';

    if (title.contains('product') || body.contains('product')) {
      route = '/products';
    } else if (title.contains('profile') || body.contains('profile')) {
      route = '/profile';
    } else if (title.contains('settings') || body.contains('settings')) {
      route = '/settings';
    } else if (title.contains('user info') || body.contains('user info')) {
      route = '/user-info';
    } else if (title.contains('about') || body.contains('about')) {
      route = '/about';
    }

    print('<<<Navigating to route: $route>>>');
    print('<<<Notification data: ${message.data}>>>');
    navigatorKey.currentState?.pushNamed(route, arguments: message);
  }

  // Initialize the local notifications
  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        final payload = notificationResponse.payload;
        if (payload == null) return;
        final message = RemoteMessage.fromMap(jsonDecode(payload));
        handleNotif(message);
      },
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  // Add push notif scheduling
  Future<void> scheduleLocalNotification({
    required String title,
    required String body,
    required DateTime scheduleTime,
    String? payload,
  }) async {
    await _localNotifications.zonedSchedule(
      // unique notification id,
      scheduleTime.millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      tz.TZDateTime.from(scheduleTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
    print("<<<objective scheduled at $scheduleTime>>>>");
  }

  // Initialize push notifications
  Future initPushNotifications() async {
    await FirebaseMessaging.instance
    .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleNotif);
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotif);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message){
      final notifications = message.notification; // Get the notification details
      if(notifications == null) return; // if notifications is null, do nothing

      // Show Snackbar Notif
      navigatorKey.currentState?.context != null
        ? ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
            SnackBar(
              content: Text(notifications.title ?? 'New Notification'),
            ),
          )
        : null;

      // Show the notification
      _localNotifications.show(
        notifications.hashCode,
        notifications.title,
        notifications.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  // Initialize push notifications
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    initPushNotifications();
    initLocalNotifications();
  }
}