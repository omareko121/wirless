// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/core/constate/imgassest.dart';
import 'package:wirless/core/serve/serveise.dart';

class ThankYouPayment extends StatelessWidget {
  const ThankYouPayment({super.key});

  @override
  Widget build(BuildContext context) {
      Myserveses myServices = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 70, right: 30, left: 30),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 221, 220, 220),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 20 + 3,
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              right: 20 + 3,
              child: Row(
                children: [
                  ...List.generate(
                      20,
                      (index) => Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                height: 2,
                                color: Color(0xffB8B8B8),
                              ),
                            ),
                          )),
                ],
              ),
            ),
            Positioned(
                left: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            Positioned(
                right: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            Positioned(
              top: -48,
              left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFD9D9D9),
                child: Lottie.asset(
                  "assest/lootis/succsesful.json",
                  height: 200,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 48 + 1),
                child: Column(
                  children: [
                    Text(
                      ' 🤍 شكرا لك عزيزي ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontFamily: 'myfont1',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'لا تنسى تاخذ سكرين شوت للصفحة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.800000011920929),
                        fontSize: 13,
                        fontFamily: 'myfont1',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الايميل',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Text(
                            '${myServices.sharedPreferences.getString("email")}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'رقم الهاتف',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Text(
                            '${myServices.sharedPreferences.getString("phone")}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الى',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Text(
                            "${myServices.sharedPreferences.getString("username")}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 0, 43, 78),
                      thickness: 1.5,
                    ),
                  
                    
                    SizedBox(
                      height: 50,
                    ),
                      Container(
                      child: Image.asset("assest/img/SVGRepo_iconCarrier2.png" ,),
                    ),
                    
                    SizedBox(height: 120),

                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            Get.offAllNamed("/homepage");
                          },
                          child: Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 9, 13, 65),
                                borderRadius: BorderRadius.circular(13)),
                            child: Center(
                              child: Text(
                                "العوده للصفحة الرئيسية",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'myfont1'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
