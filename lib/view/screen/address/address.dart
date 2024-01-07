// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/adressview.dart';
import 'package:wirless/core/class/handledata.dart';

class Addresspage extends StatelessWidget {
  const Addresspage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Addressviewcontroller());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 35, 65),
        title: const Text(
          "عـنـاويـن الـتـوصـيـل",
          style: TextStyle(
              fontFamily: 'myfont1 ',
              fontSize: 23,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 33, 59),
        onPressed: () {
          Get.toNamed("/addressaddpart2");
        },
        child: const Icon(
          Icons.add_location_alt_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: Container(
          child: GetBuilder<Addressviewcontroller>(
        builder: (controller) => Handledata(
            statusrequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.only(top: 30, right: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromARGB(255, 0, 49, 88)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${controller.data[index].addressId}",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(" : عنوان رقم ",
                                  style: TextStyle(
                                      fontFamily: 'myfont1',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 165, 215, 255))),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.data[index].addressName}",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " : الاسم",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.data[index].addressCity}",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " : المدينه",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.data[index].addressHome}",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " : البيت",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.data[index].addressStreet}",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " : الحي , الشارع",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.data[index].phoneaddress}",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ": رقم الهاتف",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 187, 12, 0),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(22),
                                        topLeft: Radius.circular(22),
                                        )),
                                child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(22)),
                                              backgroundColor: Colors.white,
                                              child: Container(
                                                height: 240,
                                                width: double.infinity,
                                                margin: EdgeInsets.only(
                                                    top: 20, left: 4, right: 4),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        " هل انت متاكد انك تريد حذف العنوان بشكل نهائي ؟ ",
                                                        style: TextStyle(
                                                            fontFamily: 'myfont1',
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255, 0, 0, 0)),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 30),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  controller.delete(
                                                                      controller
                                                                          .data[
                                                                              index]
                                                                          .addressId!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              33,
                                                                          right:
                                                                              33),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                22),
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            18,
                                                                            153,
                                                                            18),
                                                                  ),
                                                                  child: Text(
                                                                    "نعم",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'myfont1',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            22,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)),
                                                                  ),
                                                                )),
                                                            SizedBox(
                                                              width: 55,
                                                            ),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              22),
                                                                      color: Colors
                                                                              .red[
                                                                          800]),
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              33,
                                                                          right:
                                                                              33),
                                                                  child: Text(
                                                                    "لا",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'myfont1',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            22,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)),
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
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ));
              },
            )),
      )),
    );
  }
}
