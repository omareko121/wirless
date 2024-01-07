import 'package:wirless/core/class/crud.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class RaitingData {
  Crud crud;
  RaitingData(this.crud);

  raiting(String id, String desc, String raiting) async {
    var response = await crud.posdata(AppLink.raiting, {
      "id": id,
      "rating": raiting,
      "comment": desc,
    });
    return response.fold((l) => l, (r) => r);
  }
}
