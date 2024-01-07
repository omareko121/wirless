import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);
  orderspanding(String id) async {
    var response = await crud.posdata(AppLink.orderpanding, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
