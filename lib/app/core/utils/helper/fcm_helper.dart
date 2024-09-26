import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class FCMHelper {
  initLocalNotification() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'SSDM',
        'General',
        description: 'This channel is used for general notifications.',
        importance: Importance.max,
        enableLights: true,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      /*const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('notification_icon');
      */ /*final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );*/ /*
      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        // iOS: initializationSettingsDarwin,
      );
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          logger.d('initLocalNotification:  ${response.payload}');
        },
      );*/

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> selectNotification(String payload) async {
    // handle the click action here
    if (payload != null) {
      print('notification payload: $payload');
    }
    // Navigate to the desired screen or perform any action
  }

  localNotificationListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.d('main localNotificationListener:  ${message.data}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      bool canGotoSpecificPage = message.data.containsKey("url");
      // myWidget.showSimpleDialog(
      //   notification?.title ?? "",
      //   notification?.body ?? "",
      //   () {
      //     if (canGotoSpecificPage) {
      //       appHelper.onGoDetails(message.data["url"]);
      //     } else {
      //       Get.back();
      //     }
      //   },
      //   buttonText: canGotoSpecificPage ? "Goto Details" : "Ok",
      // );

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'notification_icon',
              color: AppColor.white,
              importance: Importance.max,
              priority: Priority.high,
              ongoing: true,
              styleInformation: const BigTextStyleInformation(''),
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      logger.d('localNotificationListener:  ${message.data}');
      // appHelper.onGoDetails(message.data["url"]);
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      logger.d('localNotificationListener:  ${message?.data}');
      if (message != null) {
        // appHelper.onGoDetails(message.data["url"]);
      }
    });
  }
}
