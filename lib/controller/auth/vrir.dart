// ignore_for_file: non_constant_identifier_names, unused_import, duplicate_ignore, avoid_single_cascade_in_expression_statements, unused_element, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
// ignore: unused_import
import 'package:wirless/view/screen/auth/sginin.dart';

import '../../data/datasoures/remout/auth/verefiycode.dart';
import '../../data/datasoures/remout/ResetPassword/vpassword.dart';

abstract class Vircodepasewow extends GetxController {
  Vircode();
  gotresetpaswv(String verificationCode);
}

class Vircodepasewowrimp extends Vircodepasewow {
  late String verificationCode;
  StatusRequest? statusRequest;
  Vpassword VerefiycodeemailL = Vpassword(Get.find());
  Verefiycodeemail VerfiEm = Verefiycodeemail(Get.find());

  String? email;

  @override
  Vircode() {}

  @override
  gotresetpaswv(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await VerefiycodeemailL.postdata(email!, verificationCode);
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'succsess') {
        Get.offAllNamed("/restep" , arguments: {
            "email" : email
          });
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
    } else {
      Get.defaultDialog(
          title: "خطا",
          middleText: "عزيزي هناك خطا غير متوقع الرجاء المحاوله فيما بعد",
          titleStyle: const TextStyle(
              fontFamily: 'myfont1', fontSize: 22, fontWeight: FontWeight.bold),
          middleTextStyle: const TextStyle(
              fontFamily: 'myfont1',
              fontSize: 17,
              fontWeight: FontWeight.bold));
    }

    update();
  }

  resnd() {
    VerfiEm.resend(email!);
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
}
