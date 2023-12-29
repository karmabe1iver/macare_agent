import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  //FcmSetup().initNotification();
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          sound: const RawResourceAndroidNotificationSound("custom_sound"),
          playSound: true,
          priority: Priority.high,
          enableLights: true,
          importance: Importance.max,
          enableVibration: true,
          //channel.description,
          //icon: android.smallIcon,
          // other properties...
        ),
      ),
    );
  }

  // Handle the background message here
  // ...
}

Future<void> handleMessage(RemoteMessage message) async {

}


 AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'High_import', // id
  'High Importance Notifications', // title
  importance: Importance.max,
  playSound: true,
   sound: RawResourceAndroidNotificationSound("custom_sound"),
  enableLights: true


);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class FcmSetup {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: true,

    );
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        if (notificationResponse!=null) {
          flutterLocalNotificationsPlugin.show(
            notificationResponse.hashCode,
            notificationResponse.payload,
            "",
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                sound: const RawResourceAndroidNotificationSound("custom_sound"),
                playSound: true,
                priority: Priority.high,
                enableLights: true,
                importance: Importance.max,
                enableVibration: true,
                //channel.description,
                //icon: android.smallIcon,
                // other properties...
              ),
            ),
          );
        }
        if (notificationResponse == null) return;
        // Handle notification response here
        // ...
      },
    );
    final fCMToken = await _firebaseMessaging.getToken();

    if (kDebugMode) {
      print("Token :$fCMToken");
    }
    initPushNotification();
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Handle push notifications even when the app is terminated
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              sound: const RawResourceAndroidNotificationSound("custom_sound"),
              playSound: true,
              priority: Priority.high,
              enableLights: true,
              importance: Importance.max,
              enableVibration: true,
              //channel.description,
              //icon: android.smallIcon,
              // other properties...
            ),
          ),
        );
      }
    });
  }
}
