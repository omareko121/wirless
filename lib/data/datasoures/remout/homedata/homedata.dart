import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Homedata {
  Crud crud;
  Homedata(this.crud);

  getdata() async {
    var response = await crud.posdata(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  search(String search) async {
    var response = await crud.posdata(AppLink.search, {"search" : search});
    return response.fold((l) => l, (r) => r);
  }
}
