// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/orders/panding.dart';

navipermaion() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fmcmnavi() {
  FirebaseMessaging.onMessage.listen((event) {

    FlutterRingtonePlayer.playNotification();
    Get.snackbar(event.notification!.title!, event.notification!.body!,
        titleText: Text(
          "${event.notification!.title}",
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'myfont1',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        messageText: Text(
          "${event.notification!.body}",
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'myfont1',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
    refreshpage(event.data);
  });
}

refreshpage(data) {
  if (Get.currentRoute == "/orderspanding" && data['pagename'] == "order") {
    Pandingordercontroller controller = Get.find();
    controller.refreshe();
  }
}
