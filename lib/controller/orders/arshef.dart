import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/orderpanding.dart';
import 'package:wirless/data/datasoures/remout/orders/arshef.dart';
import 'package:wirless/data/datasoures/remout/raiting.dart';

class Arshevscontroller extends GetxController {
  Ordersarshef oerdersarshef = Ordersarshef(Get.find());
  RaitingData raitingData = RaitingData(Get.find());

  List<OrdersModel> data = [];

  Myserveses myserveses = Get.find();

  late StatusRequest statusRequest;

  printpaymentmethod(int val) {
    if (val == 0) {
      return "Credit Card";
    } else if (val == 1) {
      return "PayPal";
    }
  }

  printorderstuts(String val) {
    if (val == "1") {
      return "في قائمة الانتظار";
    } else if (val == "2") {
      return "قيد التنفيذ";
    } else if (val == "3") {
      return " 🔥 في الطريق ";
    } else if (val == "4") {
      return "تم التوصيل";
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await oerdersarshef.ordersarcgevs(
        myserveses.sharedPreferences.getInt("id").toString());
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  supmintRaiting(String ordersid, double riting, String coment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await raitingData.raiting(
      ordersid,
      coment,
      riting.toString(),
    );
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getorders();
        Get.rawSnackbar(
            duration: const Duration(seconds: 4),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في المفضلة بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "تم ارسال تقييمك بنجاح , شكرا لك على ملاحظاتك نسعد بخدمتك",
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

  refreshe() {
    getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
