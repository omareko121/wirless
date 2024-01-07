// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/data/datasoures/remout/homedata/homedata.dart';
import 'package:wirless/data/datasoures/remout/items.dart';
import 'package:wirless/core/serve/serveise.dart';

abstract class Itemscontroler extends GetxController {
  initialData();
  changecat(int val, String catval);
  getitems(String catid);
  goTopageitemsditils(Itemsmodel itemsmodel);
}

class ItemscontrolerImp extends Itemscontroler {
  Homedata homedata = Homedata(Get.find());

  List categories = [];
  int? selctedCat;
  String? categories_id;
  Myserveses myserveses = Get.find();
  Itemsdata itemsdata = Itemsdata(Get.find());

  bool isSearch = false;
  TextEditingController? search;

  List<Itemsmodel> itemsmodeldata = [];

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
    var response = await homedata.search(search!.text);
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

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    search = TextEditingController();

    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selctedCat = Get.arguments['selcetedCat'];
    categories_id = Get.arguments['categories_id'];
    getitems(categories_id!);
  }

  @override
  changecat(val, catval) {
    selctedCat = val;
    categories_id = catval;
    getitems(categories_id!);

    update();
  }

  @override
  getitems(catid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getdata(
        catid, myserveses.sharedPreferences.getInt("id").toString());
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  @override
  goTopageitemsditils(itemsmodel) {
    Get.toNamed("/productditils", arguments: {'itemsmodel': itemsmodel});
  }
}
