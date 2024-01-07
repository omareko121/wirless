// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/controller/onbording.dart';
import 'package:wirless/data/datasoures/Static/static.dart';

class OnbordingList extends GetView<Onbordingcontrollerimp> {
  const OnbordingList({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onbordinglist.length,
        itemBuilder: (context, i) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  onbordinglist[i].title!,
                  style: TextStyle( fontFamily: 'myfont1', fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Lottie.asset(
                  onbordinglist[i].img!,
                  height: 300,
                  width: 320,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onbordinglist[i].body!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'myfont1',
                          height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 47, 47, 47)),
                    )),
              ],
            ));
  }
}
