
import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Itemsdata {
  Crud crud;
  Itemsdata(this.crud);

  getdata(String id , String userid) async {
    var response = await crud.posdata(AppLink.items, {"id" : id , "usersid" : userid});
    return response.fold((l) => l, (r) => r);
  }
}
