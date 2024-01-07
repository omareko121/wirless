import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Cartdata {
  Crud crud;
  Cartdata(this.crud);

  addcart(String userid, String itemsid) async {
    var response = await crud
        .posdata(AppLink.addcart, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removecart(String userid, String itemsid) async {
    var response = await crud
        .posdata(AppLink.deletcart, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getcount(String userid, String itemsid) async {
    var response = await crud.posdata(
        AppLink.getcountitems, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewcart(String userid) async {
    var response = await crud.posdata(AppLink.vewicart, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(String couponname) async {
    var response = await crud.posdata(AppLink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
