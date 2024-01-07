// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/data/Models/myfavorite.dart';
import 'package:wirless/data/datasoures/remout/myfavorite.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  List<myfavorite> data = [];

  late StatusRequest statusRequest;

  Myserveses myserveses = Get.find();

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData
        .veiwdata(myserveses.sharedPreferences.getInt("id").toString());
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List resposedata = response['data'];
        data.addAll(resposedata.map((e) => myfavorite.fromJson(e)));
      
      } else {
        statusRequest = StatusRequest.falier;
      }
    }
    update();
  }

  deletfromfavorite(String favoriteid) async {
    var response = await myfavoriteData.deletdata(favoriteid);

    data.removeWhere((element) => element.favoriteId == favoriteid);
    Get.rawSnackbar(
        duration: const Duration(seconds: 2),
        backgroundColor: const Color.fromARGB(255, 0, 29, 53),
        messageText: const Text("عزيزي تم اضافه المنتج في المفضلة بنجاح",
            style: TextStyle(
                fontFamily: 'myfont1',
                fontSize: 0,
                color: Color.fromARGB(255, 255, 255, 255))),
        titleText: const Text(
          "عزيزي تم بالفعل حذف المنتج بنجاح",
          style: TextStyle(
              fontFamily: 'myfont1',
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold ),
              textAlign: TextAlign.center,
        ));

    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  @override
  goTopageitemsditils(myfavorite itemsmodel) {
    Get.toNamed("/productditils", arguments: {'myfavmodel': itemsmodel});
  }
}
