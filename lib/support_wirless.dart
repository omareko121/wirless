// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/core/serve/serveise.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Myserveses myserveses = Get.find();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 35, 65),
        title: const Text(
          "مركز الدعم الفني",
          style: TextStyle(
              fontFamily: 'myfont1 ',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/6544cb17a84dd54dc4881b41/1heabiljl',
        visitor: TawkVisitor(
          name:'${myserveses.sharedPreferences.getString("username")}',
          email:'${myserveses.sharedPreferences.getString("phone")}',
        ),
        onLoad: () {
          print('Hello Tawk!');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: Center(
          child: Center(
            child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                height: 220, width: 220))
        ),
      ),
    );
  }
}
