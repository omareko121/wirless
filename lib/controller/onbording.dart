// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/datasoures/Static/static.dart';

abstract class Onbordingcontroller extends GetxController {
  next();
  onPageChanged(int Index);
}

class Onbordingcontrollerimp extends Onbordingcontroller {
  late PageController pageController;
  int cruunt = 0;
  Myserveses myserveses = Get.find();
  @override
  next() {
    cruunt++;

    if (cruunt > onbordinglist.length - 1) {
      myserveses.sharedPreferences.setString("step", "1");
      Get.offAllNamed("/sginup");
    } else {
      pageController.animateToPage(cruunt,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int Index) {
    cruunt = Index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
