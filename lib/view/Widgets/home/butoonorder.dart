// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wirless/controller/onbording.dart';

class ButtounOrder extends GetView<Onbordingcontrollerimp> {
  const ButtounOrder({super.key});

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
            width: 300,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 13, 65),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                "اكمال الطلب",
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
