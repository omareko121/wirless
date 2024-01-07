import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Ordersarshef {
  Crud crud;
  Ordersarshef(this.crud);
  ordersarcgevs(String id) async {
    var response = await crud.posdata(AppLink.archevs, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
