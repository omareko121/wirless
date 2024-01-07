import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> posdata(String linkurl, Map data) async {
    try {
      if (await Checinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 200) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfalier);
        }
      } else {
        return const Left(StatusRequest.internetfalier);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfalier);
    }
  }
}
