
import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class DitilesData {
  Crud crud;
  DitilesData(this.crud);

  getdata(String id) async {
    var response = await crud.posdata(AppLink.detiles, {"id" : id });
    return response.fold((l) => l, (r) => r);
  }
}
