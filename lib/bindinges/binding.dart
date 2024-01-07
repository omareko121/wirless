import 'package:get/get.dart';
import 'package:wirless/core/class/crud.dart';

class Ininilbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
