// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wirless/controller/onbording.dart';

class ButtounCheck extends GetView<Onbordingcontrollerimp> {
  const ButtounCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        child: InkWell(
          onTap: () {
            Get.toNamed("/CheckOUT");
          },
          child: Container(
            height: 45,
            width: 350,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 13, 65),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                "اتمام الطلب",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'myfont1'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
