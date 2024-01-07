import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/cartmodel.dart';
import 'package:wirless/data/Models/orderpanding.dart';
import 'package:wirless/data/datasoures/remout/ditiles.dart';

class Orderconroller extends GetxController {
  OrdersModel? listmodel;

  DitilesData deitilesData = DitilesData(Get.find());

  List<cartmodel> data = [];

  late StatusRequest statusRequest;
  Myserveses myserveses = Get.find();

  @override
  void onInit() {
    listmodel = Get.arguments['ordermodel'];
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await deitilesData.getdata(listmodel!.oredersId.toString());
    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => cartmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  
}
