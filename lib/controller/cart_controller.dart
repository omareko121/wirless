// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/cartmodel.dart';
import 'package:wirless/data/Models/coupon.dart';
import 'package:wirless/data/datasoures/remout/cart/cart.dart';

class CartController extends GetxController {
  Cartdata cartdata = Cartdata(Get.find());
  late StatusRequest statusRequest;
  Myserveses myserveses = Get.find();

  CouponModel? couponModel;
  cartmodel? caartmodel;

  int? discountcoupon = 0;
  String? couponname;
  String? couponnid;

  TextEditingController? controllercoupon;

  List<cartmodel> data = [];

  num priceOrders = 0;
  int totalcountitems = 0;

  addcart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.addcart(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            duration: const Duration(seconds: 2),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في اسله بنجاح",
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

  gotocheckout() {
    if (data.isEmpty) {
      return Get.snackbar(
          "خطأ ", "عزيزي الرجاء أختيار منتج ثم العوده لأكمال الطلب",
          messageText: const Text(
            "عزيزي الرجاء أختيار منتج ثم العوده لأكمال الطلب",
            style: TextStyle(
                fontFamily: 'myfont1',
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          titleText: const Text(
            "data",
            style: TextStyle(fontSize: 0),
          ));
    }

    Get.toNamed("/CheckOUT", arguments: {
      "couponid": couponnid ?? 0,
      "priceorder": priceOrders.toString(),
      "discountcoupon": discountcoupon.toString(),
      "totalUSD": getUsd(),
      "totalsar": getTotalPrice(),
    });
  }

  getTotalPrice() {
    return (priceOrders - priceOrders * discountcoupon! / 100);
  }

  getUsd() {
    return (getTotalPrice() / (3.75)).toStringAsFixed(1);
  }

  getcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.checkcoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount.toString());
        couponname = couponModel!.couponName;
        couponnid = couponModel!.couponId.toString();
        Get.rawSnackbar(
            duration: const Duration(seconds: 3),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في h بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي تم استخدام الكوبون بنجاح",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ));
      }
      // End
    }else if(StatusRequest.falier == statusRequest){
        discountcoupon = 0;
        couponname = null;
        couponnid = null;
        Get.rawSnackbar(
            duration: const Duration(seconds: 3),
            backgroundColor: const Color.fromARGB(255, 155, 32, 32),
            messageText: const Text("عزيزي تم اضافه المنتج في h بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي الكوبون المستخدم منتهي او غير موجود ",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ));
      }
    update();
  }

  reomveFromCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.removecart(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

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

  resetvarcart() {
    totalcountitems = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreshpage() {
    resetvarcart();
    viewcart();
  }

  getcountfromcart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartdata.getcount(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        int countitems = 0;
        // data.addAll(response['data']);
        countitems = int.parse(response['data']);
        return countitems;
      } else {
        statusRequest = StatusRequest.falier;
      }
    }
    update();
  }

  viewcart() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();

    var response = await cartdata
        .viewcart(myserveses.sharedPreferences.getInt("id").toString());
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponseprice = response['countprice'];
          data.clear();
          totalcountitems = dataresponseprice['totalcount'];
          data.addAll(dataresponse.map((e) => cartmodel.fromJson(e)));

          priceOrders =
              double.parse(dataresponseprice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.falier;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    viewcart();
    super.onInit();
  }
}
