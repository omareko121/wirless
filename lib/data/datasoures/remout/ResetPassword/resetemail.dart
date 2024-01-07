import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postdata(String email , String password) async {
    var response = await crud.posdata(AppLink.resetpassword, {
      "email" : email , 
      "password" : password , 

    });
    return response.fold((l) => l, (r) => r);
  }
}
