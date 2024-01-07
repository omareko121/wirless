// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/orders/ditiles.dart';
import 'package:wirless/core/class/handledata.dart';

class  Ordersditles extends StatelessWidget {
  const Ordersditles({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Orderconroller());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 39, 71),
          onPressed: () {
            Get.toNamed("/support");
          },
          child: Icon(
            Icons.support_agent_sharp,
            color: Colors.white,
            size: 30,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 35, 65),
          title: const Text(
            "مـعـلـومـات الـطـلـب",
            style: TextStyle(
                fontFamily: 'myfont1',
                fontSize: 22,
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
              size: 39,
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 15),
            child: GetBuilder<Orderconroller>(
              builder: (controller) => Handledata(
                statusrequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6),
                      child: Card(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          padding: EdgeInsets.only(top: 40, bottom: 40),
                          child: Column(
                            children: [
                              Table(
                                children: [
                                  TableRow(
                                    children: [
                                      Text(
                                        "المنتج",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      Text(
                                        "الكمية",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      Text(
                                        "السعر",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(
                                      children: [
                                        Text(
                                          "${controller.data[index].itemsName}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'myfont1',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 0, 43, 78)),
                                        ),
                                        Text(
                                          "${controller.data[index].countitems}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'myfont1',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 0, 43, 78)),
                                        ),
                                        Text(
                                          "SAR ${controller.data[index].itemsprice!.toStringAsFixed(1)}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'myfont1',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 0, 43, 78)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " المبلغ الاجمالي",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 17, 46)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "SAR ${controller.listmodel!.oredersTotalprice!.toStringAsFixed(1)}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 0, 54, 146)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 0, 36, 66),
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "عنوان التوصيل",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'myfont1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Container(
                      margin: EdgeInsets.all(
                        20,
                      ),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 12, bottom: 12, right: 1, left: 1),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.listmodel!.addressName}",
                                    style: TextStyle(
                                        fontFamily: 'Myfont1',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              subtitle: Row(children: [
                                Text(
                                  "${controller.listmodel!.addressCity} , ${controller.listmodel!.addressStreet}  ",
                                  style: TextStyle(
                                      fontFamily: 'Myfont1',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),
                                )
                              ]),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
