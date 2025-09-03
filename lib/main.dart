import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_test/api/firebase_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'app.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized
  tz.initializeTimeZones(); // Initialize time zones
  await Firebase.initializeApp();
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      await Permission.scheduleExactAlarm.request();
    }
  }
  var status = await Permission.scheduleExactAlarm.status;
  print('<<<Exact alarm permission status: $status>>>');
  await FirebaseApi().initNotifications();
  await FirebaseApi().initLocalNotifications();
  await FirebaseApi().scheduleLocalNotification(
    title: "Scheduled Push Notification", // Title of the notification
    body: "This is a scheduled push notification.", // Body of the notification
    scheduleTime: DateTime.now().add(Duration(seconds: 20)), // Schedule for 20 seconds later
  );
  runApp(const MyApp());
}
