// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wirless/controller/navigation.dart';
import 'package:wirless/core/class/handledata.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(NotificationController());
    return Scaffold(
        body: GetBuilder<NotificationController>(
      builder: (controller) => Handledata(
        statusrequest: controller.statusRequest,
        widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Center(
                    child: Text(
                  "الـتـنـبـيـهـات",
                  style: TextStyle(
                      fontFamily: 'myfont1',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 35, 65)),
                )),
                SizedBox(
                  height: 15,
                ),
                ...List.generate(
                    controller.data.length,
                    (index) => Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Card(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            child: Container(
                                padding: EdgeInsets.all(20),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${controller.data[index]['notification_title']}",
                                              style: TextStyle(
                                                  fontFamily: 'myfont1',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 71, 133)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              " ${controller.data[index]['notification_body']} ",
                                              style: TextStyle(
                                                  fontFamily: 'myfont1',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 25, 48)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      child: Text(
                                        Jiffy.parse(controller.data[index]
                                                ['notification_date'])
                                            .fromNow(),
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 0, 25, 48)),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ))
              ],
            )),
      ),
    ));
  }
}
