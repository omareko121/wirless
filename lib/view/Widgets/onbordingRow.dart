// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/onbording.dart';
import 'package:wirless/data/datasoures/Static/static.dart';

class OnbrodingRow extends StatelessWidget {
  const OnbrodingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onbordingcontrollerimp>
    (builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onbordinglist.length,
            (index) => AnimatedContainer(
                  margin: EdgeInsets.only(right: 5),
                  duration: Duration(milliseconds: 500),
                  width: controller.cruunt == index? 20 :6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: BorderRadius.circular(10)),
                )),
      ],
    ));
  }
}
