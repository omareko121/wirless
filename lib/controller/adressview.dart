// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/address.dart';
import 'package:wirless/data/datasoures/remout/address/address.dart';

class Addressviewcontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  List<Addressmodel> data = [];

  Myserveses myserveses = Get.find();

  delete(String addressid) {
    addressData.deletdata(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getdata(
      myserveses.sharedPreferences.getInt('id').toString(),
    );
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Addressmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
