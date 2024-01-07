import 'package:get/get.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/hundlingdata.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/datasoures/remout/notivation.dart';

class NotificationController extends GetxController {
  NotivationData nootificationData = NotivationData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  Myserveses myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await nootificationData.veiwdata(
        myServices.sharedPreferences.getInt("id").toString());

    statusRequest = hundlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.falier;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
