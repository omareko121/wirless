import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/address.dart';
import 'package:wirless/data/datasoures/remout/address/address.dart';
import 'package:wirless/data/datasoures/remout/chekout.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  Myserveses myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? addressid;
  String? discountcoupon;
  String? totalPrice;
  String? totalPriceSAR;

  late String couponid;
  late String priceorder;

  List<Addressmodel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getdata(myServices.sharedPreferences.getInt("id").toString());

    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => Addressmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (addressid == null) {
      return Get.snackbar("خطأ ", "عزيزي الرجاء اختيار طريقة دفع وعنوان صحيح",
          messageText: const Text(
            "عزيزي الرجاء اختيار طريقة دفع وعنوان صحيح",
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
    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getInt("id").toString(),
      "addressid": addressid.toString(),
      "pricedelivery": "0",
      "ordersprice": priceorder,
      "couponid": couponid,
      "paymentmethod": paymentMethod,
      "discountcoupon": discountcoupon.toString(),
      
    };

    var response = await checkoutData.checkout(data);

    statusRequest = hundlingdata(response);

    print("----------------------------------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed("/ThankYouPayment");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar(
            "خطأ مجهول", "عزيزي نعتذر عن الخطأ الرجاء المحاوله فيما بعد");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'].toString();
    priceorder = Get.arguments['priceorder'];
    discountcoupon = Get.arguments['discountcoupon'].toString();
    totalPrice = Get.arguments['totalUSD'];
    totalPriceSAR = Get.arguments['totalsar'].toStringAsFixed(0);
    getShippingAddress();
    super.onInit();
  }
}
