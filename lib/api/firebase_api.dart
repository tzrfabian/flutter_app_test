import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_test/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
    // Handle background message
    print("Notif Title: ${message.notification?.title}");
    print("Notif Body: ${message.notification?.body}");
    print("Notif Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Initialize the FlutterLocalNotificationsPlugin
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleNotif(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      '/products',
      arguments: message,
    );
  }

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
      // Handle foreground messages
      if(notifications == null) return; // if notifications is null, do nothing

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
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    initPushNotifications();
    initLocalNotifications();
  }
}