import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  veiwdata() async {
    var response = await crud.posdata(AppLink.offers,{});
    return response.fold((l) => l, (r) => r);
  }
}
