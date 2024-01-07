
// ignore_for_file: file_names, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
// ignore: unused_import
import 'package:wirless/view/screen/auth/sginin.dart';

import '../../data/datasoures/remout/auth/verefiycode.dart';

abstract class Vircodepasewow extends GetxController {
  vircode();
  gotresetpaswv(String verificationCode);
  resnd();
}

class Vircodepasewowrimp extends Vircodepasewow {
  late String verificationCode;
  StatusRequest? statusRequest;
  Verefiycodeemail veerefiycodeemail = Verefiycodeemail(Get.find());

  String? email;
  Myserveses myserveses = Get.find();

  @override
  vircode() {}

  @override
  gotresetpaswv(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await veerefiycodeemail.postdata(email!, verificationCode);
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed("/succesful");
      } else {
        Get.defaultDialog(
            title: "خطا",
            middleText: "عزيزي الرمز غير صحيح تاكد من الرمز المرسل",
            titleStyle: const TextStyle(
                fontFamily: 'myfont1',
                fontSize: 22,
                fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(
                fontFamily: 'myfont1',
                fontSize: 17,
                fontWeight: FontWeight.bold));
      }
    } else {
      Get.defaultDialog(
          title: "خطا",
          middleText: "عزيزي الرمز غير صحيح تاكد من الرمز المرسل",
          titleStyle: const TextStyle(
              fontFamily: 'myfont1', fontSize: 22, fontWeight: FontWeight.bold),
          middleTextStyle: const TextStyle(
              fontFamily: 'myfont1',
              fontSize: 17,
              fontWeight: FontWeight.bold));
    }

    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  resnd() {
    veerefiycodeemail.resend(email!);
  }
}
