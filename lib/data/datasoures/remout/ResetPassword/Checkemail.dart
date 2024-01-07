// ignore_for_file: file_names

import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class CheckEmailRES {
  Crud crud;
  CheckEmailRES(this.crud);

  postdata(String email) async {
    var response = await crud.posdata(AppLink.checkres, {
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
