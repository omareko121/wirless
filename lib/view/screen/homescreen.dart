// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/homescreen_controller.dart';

import '../Widgets/home/buttombar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImb());

    return GetBuilder<HomeScreenControllerImb>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 0, 29, 53),
            onPressed: () {
              controller.chnagepage(0);
            },
            child: Icon(
              Icons.home,
               size: 33,
               color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Color.fromARGB(255, 255, 255, 255),
            height: 75,
            
            shadowColor: Colors.black,
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            padding: EdgeInsets.only(right: 12 , left: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    Butoombar(
                      onPressed: () {
                        Get.toNamed("/cart");
                      },
                      iconData: Icons.shopping_bag,
                      tetxapp: 'السلة',
                      active: controller.curuntpage == 1 ? true : false,
                    ),
                    Butoombar(
                      onPressed: () {
                        controller.chnagepage(2);
                      },
                      iconData: Icons.notifications_active,
                      tetxapp: 'التنبيهات',
                      active: controller.curuntpage == 2 ? true : false,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Butoombar(
                      onPressed: () {
                        controller.chnagepage(4);
                      },
                      iconData: Icons.local_offer_sharp,
                      tetxapp: 'عشانك',
                      active: controller.curuntpage == 4 ? true : false,
                    ),
                    Butoombar(
                      onPressed: () {
                        controller.chnagepage(3);
                      },
                      iconData: Icons.settings,
                      tetxapp: 'الاعدادات',
                      active: controller.curuntpage == 3 ? true : false,
                    ),
                  ],
                )
              ],
            ),
          ),
          body: WillPopScope(
              child: controller.listpage.elementAt(controller.curuntpage),
              onWillPop: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.white,
                        child: Container(
                          height: 240,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20, left: 4, right: 4),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " هل انت متاكد انك تريد الخروج من التطبيق ؟ ",
                                  style: TextStyle(
                                      fontFamily: 'myfont1',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            exit(0);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 33, right: 33),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                color: Colors.red[800]),
                                            child: Text(
                                              "نعم",
                                              style: TextStyle(
                                                  fontFamily: 'myfont1',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 55,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                color: Color.fromARGB(
                                                    255, 18, 153, 18)),
                                            padding: EdgeInsets.only(
                                                left: 33, right: 33),
                                            child: Text(
                                              "لا",
                                              style: TextStyle(
                                                  fontFamily: 'myfont1',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                return Future.value(false);
              })),
    );
  }
}
