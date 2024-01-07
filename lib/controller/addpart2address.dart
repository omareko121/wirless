// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/datasoures/remout/address/address.dart';

class Adreescontrollerpart2 extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  Myserveses myserveses = Get.find();

  TextEditingController? city;
  TextEditingController? name;
  TextEditingController? home;
  TextEditingController? street;
  // String? late;
  // String? lang;

  inialdata() {
    // late = Get.arguments['lat'];
    // lang = Get.arguments['long'];
  }

  addadress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addadress(
        myserveses.sharedPreferences.getInt('id').toString(),
        name!.text,
        city!.text,
        street!.text,
        home!.text,
        myserveses.sharedPreferences.getString('phone').toString());

    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed("/homepage");
        Get.rawSnackbar(
            duration: const Duration(seconds: 4),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في المفضلة بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي تم بالفعل اضافه العنوان بنجاح",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  @override
  void onInit() {
    city = TextEditingController();
    name = TextEditingController();
    home = TextEditingController();
    street = TextEditingController();
    inialdata();
    super.onInit();
  }
}
