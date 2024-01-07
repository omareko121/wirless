
import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.posdata(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}