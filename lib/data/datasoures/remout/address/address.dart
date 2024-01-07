import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getdata(String userid) async {
    var response = await crud.posdata(AppLink.viewaddress, {
      "usersid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addadress( String userid, String name, String city, String street, String home , String phone) async {
    var response = await crud.posdata(AppLink.addressadd, {
      "usersid": userid,
      "name": name,  
      "city": city,
      "street": street,
      "home": home,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletdata(String addressid) async {
    var response = await crud.posdata(
        AppLink.deleteaddress, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  editdata(String userid, String itemsid) async {
    var response = await crud
        .posdata(AppLink.editaddress, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
