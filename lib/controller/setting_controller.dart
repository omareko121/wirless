// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:wirless/core/serve/serveise.dart';

class Settingcontroller extends GetxController {
  Myserveses myserveses = Get.find();

  logout() {
    String userid = myserveses.sharedPreferences.getInt("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myserveses.sharedPreferences.clear();
    Get.offAllNamed("/login");
  }
}
