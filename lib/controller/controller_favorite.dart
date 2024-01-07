import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/datasoures/remout/favorite.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};

  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  Myserveses myserveses = Get.find();

  setfavorite(id, value) {
    isFavorite[id] = value;
    update();
  }

  addfavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addfavorite(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            duration: const Duration(seconds: 2),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في المفضلة بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي تم اضافه المنتج في المفضلة بنجاح",
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

  removefavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removefavorite(
        myserveses.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            duration: const Duration(seconds: 2),
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            messageText: const Text("عزيزي تم اضافه المنتج في المفضلة بنجاح",
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontSize: 0,
                    color: Color.fromARGB(255, 255, 255, 255))),
            titleText: const Text(
              "عزيزي تم حذف المنتج من المفضلة بنجاح",
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
}
