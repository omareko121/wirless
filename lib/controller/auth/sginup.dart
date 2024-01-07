// ignore_for_file: non_constant_identifier_names, avoid_single_cascade_in_expression_statements, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/data/datasoures/remout/auth/sginup_data.dart';
// ignore: unused_import
import 'package:wirless/view/screen/auth/sginin.dart';

import '../../core/class/statusRequest.dart';
import '../../core/function/hundlingdata.dart';

abstract class Sginuocontroller extends GetxController {
  sginup();
  Logintopage();
}

class Sginuocontrollerimb extends Sginuocontroller {
  late TextEditingController email;
  late TextEditingController Paswword;
  late TextEditingController phone;
  late TextEditingController username;

  StatusRequest? statusRequest;

  Sginupdata sginupdata = Sginupdata(Get.find());

  List data = [];


  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  sginup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await sginupdata.postdata(
          username.text, Paswword.text, email.text, phone.text);
      statusRequest = hundlingdata(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.offAllNamed("/checEmail", arguments: {"email": email.text});
          
          Get.delete<Sginuocontrollerimb>();
        } else {
          Get.defaultDialog(
              title: "خطا",
              middleText: "عزيزي الايميل المستخدم او رقم الهاتف موجود بالفعل",
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
            middleText:
                "عزيزي هناك خطا غير مفهوم الرجاء المحاوله مره اخرى في وقت لاحق",
            titleStyle: const TextStyle(
                fontFamily: 'myfont1',
                fontSize: 22,
                fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(
                fontFamily: 'myfont1',
                fontSize: 17,
                fontWeight: FontWeight.bold));
      }

      update();
    } else {
      Get.defaultDialog(
          title: "خطا",
          middleText: "عزيزي تاكد من كتابه الحقول كلها ب الشكل الصحيح",
          titleStyle: const TextStyle(
              fontFamily: 'myfont1', fontSize: 22, fontWeight: FontWeight.bold),
          middleTextStyle: const TextStyle(
              fontFamily: 'myfont1',
              fontSize: 17,
              fontWeight: FontWeight.bold));
    }
  }

  bool isvis = true;

  showpassword() {
    isvis = isvis == true ? false : true;
    update();
  }

  @override
  Logintopage() {
    Get.offNamed("login");
  }

  @override
  void onInit() {
    email = TextEditingController();
    Paswword = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    Paswword.dispose();
    email.dispose();
    super.dispose();
  }
}
