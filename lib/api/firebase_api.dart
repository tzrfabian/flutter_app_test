import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/navigation/main_navigation.dart';
import 'package:flutter_app_test/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

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
    } else if (title.contains('user info') || body.contains('user info')) {
      route = '/user-info';
    } else if (title.contains('settings') || body.contains('settings')) {
      route = '/settings';
    } else if (title.contains('about') || body.contains('about')) {
      route = '/about';
    }

    // Determine the tab index based on the route
    int tabIndex = 0;
    switch (route) {
      case '/products':
        tabIndex = 1;
        break;
      case '/user-info':
        tabIndex = 2;
        break;
      case '/settings':
        tabIndex = 3;
        break;
      case '/about':
        tabIndex = 4;
        break;
      default:
        tabIndex = 0;
    }

    // Check if tabSwitcher is available
    if (MainNavigation.tabSwitcher != null) {
      MainNavigation.tabSwitcher!(tabIndex);
      print('<<<Tab Switched to: $tabIndex>>>');
    }
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
    final platform = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await platform?.createNotificationChannel(_androidChannel);
  }

  // Schedule local notification using Timer (works reliably)
  Future<void> scheduleLocalNotification({
    required String title,
    required String body,
    required DateTime scheduleTime,
    String? payload,
  }) async {
    final delay = scheduleTime.difference(DateTime.now());
    final currentTime = DateTime.now();

    if (delay.inSeconds <= 0) {
      // If schedule time is in the past, show immediately
      await _localNotifications.show(
        currentTime.millisecondsSinceEpoch ~/ 1000,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        payload: payload,
      );
      return;
    }

    // Use Timer for reliable scheduling
    Timer(delay, () async {
      await _localNotifications.show(
        currentTime.millisecondsSinceEpoch ~/ 1000,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        payload: payload,
      );
    });
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
    FirebaseMessaging.onMessage.listen((message) {
      final notifications = message.notification;
      if (notifications == null) return;

      // Show Snackbar Notif
      navigatorKey.currentState?.context != null
          ? ScaffoldMessenger.of(
              navigatorKey.currentState!.context,
            ).showSnackBar(
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

  // Request battery optimization bypass
  Future<void> requestBatteryOptimizationBypass() async {
    if (Platform.isAndroid) {
      try {
        await Permission.ignoreBatteryOptimizations.request();
      } catch (e) {
        // Silently handle error - not all devices support this
      }
    }
  }

  // Initialize all notifications
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    initPushNotifications();
    initLocalNotifications();
  }
}
