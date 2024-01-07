// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wirless/view/screen/cart.dart';
import 'package:wirless/view/screen/homepage.dart';
import 'package:wirless/view/screen/nativaction.dart';
import 'package:wirless/view/screen/offers.dart';
import 'package:wirless/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  chnagepage(int creenutpage);
}

class HomeScreenControllerImb extends HomeScreenController {
  int curuntpage = 0;

  List<Widget> listpage = [
    Homepage(),
    Cart(),
    Notifications(),
    Setting(),
    Offers(),
  ];

  @override
  chnagepage(int creenutpage) {
    curuntpage = creenutpage;
    update();
  }
}
