// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/onbording.dart';
import 'package:wirless/core/constate/color.dart';
import 'package:wirless/data/datasoures/Static/static.dart';
import 'package:wirless/view/Widgets/bordingbutoon.dart';
import 'package:wirless/view/Widgets/onbording.dart';
import 'package:wirless/view/Widgets/onbordingRow.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onbordingcontrollerimp());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 4, child: OnbordingList()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  OnbrodingRow(),
                  ButtonOnBording(),
                ],
              ))
        ],
      )),
    );
  }
}
