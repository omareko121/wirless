
import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addfavorite(String userid , String itemsid) async {
    var response = await crud.posdata(AppLink.add, {"usersid" : userid , "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }

    removefavorite(String userid , String itemsid) async {
    var response = await crud.posdata(AppLink.remove, {"usersid" : userid , "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
