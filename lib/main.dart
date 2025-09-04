import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_test/api/firebase_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Request necessary permissions
  await Permission.notification.request();

  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      await Permission.scheduleExactAlarm.request();
    }
  }

  // Initialize Firebase API
  final firebaseApi = FirebaseApi();

  // Request battery optimization bypass (helps with scheduled notifications)
  await firebaseApi.requestBatteryOptimizationBypass();

  // Initialize notifications
  await firebaseApi.initNotifications();

  // Schedule a test notification
  final scheduleTime = DateTime.now().add(Duration(seconds: 10));
  await firebaseApi.scheduleLocalNotification(
    title: "Scheduled Push Notification",
    body: "This is a scheduled push notification.",
    scheduleTime: scheduleTime,
  );

  runApp(const MyApp());
}