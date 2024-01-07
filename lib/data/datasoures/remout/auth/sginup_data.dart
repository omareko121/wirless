import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Sginupdata {
  Crud crud;
  Sginupdata(this.crud);

  postdata(String username ,String password ,String email ,String phone ) async {
    var response = await crud.posdata(AppLink.sginup, {
      "username" : username , 
      "password" : password , 
      "email" : email, 
      "phone" : phone, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
