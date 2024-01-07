// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/cart_controller.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/data/Models/myfavorite.dart';
import 'package:wirless/data/datasoures/Static/static.dart';
import 'package:wirless/data/datasoures/remout/cart/cart.dart';

abstract class ProductditilsController extends GetxController {}

class ProductditilsControllerImp extends ProductditilsController {
  late Itemsmodel itemsmodel;
  Cartdata cartdata = Cartdata(Get.find());
  late StatusRequest statusRequest;
  Myserveses myserveses = Get.find();

  // CartController cartController = Get.put(CartController());
  int countitems = 0;
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsmodel = Get.arguments['itemsmodel'];
    statusRequest = StatusRequest.success;
    update();
  }

  addcart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.addcart(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            duration: const Duration(seconds: 2),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في h بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي تمت اضافة المنتج في السله بنجاح",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }
    update();
  }

  reomveFromCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.removecart(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            duration: const Duration(seconds: 2),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في h بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي تمت ازاله المنتج من السله بنجاح",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }
    update();
  }

  add() {
    addcart(itemsmodel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      reomveFromCart(itemsmodel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
