// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/view/screen/auth/login.dart';

class suctow extends StatefulWidget {
  const suctow({super.key});

  @override
  State<suctow> createState() => _suctowState();
}

class _suctowState extends State<suctow> {

  @override
  void initState() {
    super.initState();
    nive();
  }

  nive() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Login()));
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
                "😉 تم تغيير كلمه المرور بنجاح",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , fontFamily: 'myfont1' ),
                textAlign: TextAlign.center,
              )),
        ),

         

      ]),
    );
  }
}