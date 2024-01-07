// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/data/datasoures/remout/offers.dart';

import '../data/datasoures/remout/homedata/homedata.dart';

class Offerscontrlloer extends GetxController {
  OffersData offersData = OffersData(Get.find());
  Homedata hoomedata = Homedata(Get.find());

  List<Itemsmodel> data = [];
  List<Itemsmodel> itemsmodeldata = [];

  late StatusRequest statusRequest;

  bool isSearch = false;
  TextEditingController? search;

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

  searchitems() async {
    statusRequest = StatusRequest.loading;
    var response = await hoomedata.search(search!.text);
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsmodeldata.clear();
        List responsedata = response['data'];
        itemsmodeldata.addAll(responsedata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.veiwdata();
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  goTopageitemsditils(itemsmodel) {
    Get.toNamed("/productditils", arguments: {'itemsmodel': itemsmodel});
  }

  @override
  void onInit() {
    search = TextEditingController();

    getData();
    super.onInit();
  }
}
