import 'package:wirless/core/class/statusRequest.dart';

hundlingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
