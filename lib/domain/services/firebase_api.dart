import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  static String? currentUuid;
  static bool isVideo = false;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.data);

      if (Platform.isAndroid) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: UniqueKey().hashCode,
            channelKey: 'high_importance_channel',
            title: message.notification?.title ?? '',
            body: message.notification?.body ?? '',
            payload: message.data.map(
              (key, value) => MapEntry(
                key,
                value.toString(),
              ),
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleNavigationOnNotificationBackground(message);
    });
  }

  static void onAppTerminateMode() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        handleNavigationOnNotification(message);
      }
    });
  }

  void onDidReceiveNotificationResponse(
      ReceivedNotification notificationResponse) async {
    if (notificationResponse.payload != null) {
      var message = notificationResponse.payload;
      if (message != null) {
        handleNavigationOnNotification(RemoteMessage.fromMap(message));
      }
    }
  }

  static void handleNavigationOnNotification(RemoteMessage message) {}

  static void handleNavigationOnNotificationBackground(RemoteMessage message) {}

  static Future<void> initilizeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'its demo Notification',
          channelDescription: 'Demo Noteification ',
          ledColor: Colors.blue,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'high_importance_channel',
            channelGroupName: 'Group 1')
      ],
      debug: true,
    );

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) async {
        handleNavigationOnNotification(
            RemoteMessage(data: receivedAction.payload!));
      },
    );

    // AwesomeNotifications().actionStream.listen((notification) {
    //   if (notification.channelKey == 'high_importance_channel') {
    //     handleNavigationOnNotification(
    //         RemoteMessage(data: notification.payload!));
    //   }
    // });
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}
}
