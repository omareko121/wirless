// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:wirless/controller/orders/arshef.dart';

void showdailog(BuildContext context, String ordersid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        "عزيزي بملاحظاتك نرتقي وبأرآئك نتميز",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontFamily: 'myfont1',
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        "وبأرآئك نتميز",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 0,
          color: Colors.black,
          fontFamily: 'myfont1',
          fontWeight: FontWeight.bold,
        ),
      ),
      // your app's logo?
      image: Image.asset(
        "assest/img/logo3.png",
        height: 220,
      ),
      submitButtonTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: 'myfont1',
        fontWeight: FontWeight.bold,
      ),
      submitButtonText: 'ارسال',

      commentHint: "اكتب ملاحظاتك هنا لتحسين تجربتك مستقبلا",
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        Arshevscontroller controller = Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
        controller.supmintRaiting(ordersid, response.rating, response.comment);
      },
    ),
  );
}
