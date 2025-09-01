import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_test/api/firebase_api.dart';
import 'app.dart';
void main() async {
  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    // Handle background message
    print("Notif Title: ${message.notification?.title}");
    print("Notif Body: ${message.notification?.body}");
    print("Notif Payload: ${message.data}");
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}
