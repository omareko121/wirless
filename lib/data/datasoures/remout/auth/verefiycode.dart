import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Verefiycodeemail {
  Crud crud;
  Verefiycodeemail(this.crud);

  postdata(String email ,String verifycode , ) async {
    var response = await crud.posdata(AppLink.vemail, {
      "email" : email, 
      "verfiycode" : verifycode, 
    });
    return response.fold((l) => l, (r) => r);
  }




  resend(String email)async{
        var response = await crud.posdata(AppLink.resndVerfycode, {
      "email" : email, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
