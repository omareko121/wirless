// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wirless/controller/onbording.dart';

class ButtonOnBording extends GetView<Onbordingcontrollerimp> {
  const ButtonOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Container(
        child: InkWell(
          onTap: (){
                            controller.next();

          },
          child: Container(
            height: 45,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.circular(16)
            ),
            child: Center(
              child: Text(
                "التالي",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold , color: Colors.white , fontFamily: 'myfont1'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
