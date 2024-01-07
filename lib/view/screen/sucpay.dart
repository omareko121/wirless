// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';



class succesfulpayment extends StatefulWidget {
  const succesfulpayment({super.key});

  @override
  State<succesfulpayment> createState() => _succesfulpaymentState();
}

class _succesfulpaymentState extends State<succesfulpayment> {

  @override
  void initState() {
    super.initState();
    nive();
  }

  nive() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed("/homepage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Lottie.asset(
            "assest/lootis/succsesful.json",
            height: 250,
          ),
        ),
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 50 ,),
              child: Text(
                "😉 تم اكتمال الطلب بنجاح",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold , fontFamily: 'myfont1' ),
                textAlign: TextAlign.center,
              )),
        ),

         

      ]),
    );
  }
}