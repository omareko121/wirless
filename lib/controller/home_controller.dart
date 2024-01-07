
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/data/datasoures/remout/homedata/homedata.dart';

abstract class Homecontroller extends GetxController {
  initilData();
  getdata();
  gtoitems(List categories, int selcetedCat, String catid);
}

class Homecontrollerimb extends Homecontroller {
  Myserveses myserveses = Get.find();

  List<Itemsmodel> itemsdata = [];

  String? username;
  int? id;
  String? email;
  String? phone;
  String? password;
  bool isSearch = false;
  TextEditingController? search;

  // List data = [];
  List categories = [];
  List items = [];
  List imghome = [];
  // List data = [];

  Homedata hoomedata = Homedata(Get.find());

  late StatusRequest statusRequest;

  Checksearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
      update();
    }
  }

  OnSearch() {
    isSearch = true;
    searchitems();
    update();
  }

  @override
  initilData() {
    username = myserveses.sharedPreferences.getString('username');
    id = myserveses.sharedPreferences.getInt('id');
    email = myserveses.sharedPreferences.getString('email');
    phone = myserveses.sharedPreferences.getString('phone');
    password = myserveses.sharedPreferences.getString('password');
  }

  @override
  void onInit() {
    search = TextEditingController();
    
    getdata();
    initilData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await hoomedata.getdata();
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        imghome.addAll(response['imghome']['data']);
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  searchitems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await hoomedata.search(search!.text);
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsdata.clear();
        List responsedata = response['data'];
        itemsdata.addAll(responsedata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  @override
  gtoitems(categories, selcetedCat, catid) {
    Get.toNamed("items", arguments: {
      'categories': categories,
      'selcetedCat': selcetedCat,
      'categories_id': catid,
    });
  }

  goTopageitemsditils(itemsmodel2) {
    Get.toNamed("/productditils", arguments: {'itemsmodel': itemsmodel2});
  }
}
