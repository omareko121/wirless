import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Vpassword {
  Crud crud;
  Vpassword(this.crud);

  postdata(String email , String verfiycode) async {
    var response = await crud.posdata(AppLink.vpasswordresset, {
      "email" : email , 
      "verfiycode" : verfiycode , 
    });
    return response.fold((l) => l, (r) => r);
  }
}
