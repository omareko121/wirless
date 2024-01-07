import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  veiwdata(String id) async {
    var response = await crud.posdata(AppLink.favoriteveiw , {"id" : id });
    return response.fold((l) => l, (r) => r);
  }

  deletdata(String id) async {
    var response = await crud.posdata(AppLink.deletforver , {"id" : id});
    return response.fold((l) => l, (r) => r);
  }

}
