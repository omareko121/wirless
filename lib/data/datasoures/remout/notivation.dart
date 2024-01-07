import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class NotivationData {
  Crud crud;
  NotivationData(this.crud);

  veiwdata(String id) async {
    var response = await crud.posdata(AppLink.notivation , {"id" : id });
    return response.fold((l) => l, (r) => r);
  }
}
