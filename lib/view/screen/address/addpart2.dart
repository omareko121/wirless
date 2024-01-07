// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/addpart2address.dart';
import 'package:wirless/core/class/handledata.dart';
import 'package:wirless/core/function/validator.dart';

import 'package:wirless/view/Widgets/auth/formfeld.dart';

class Addressadd2 extends StatelessWidget {
  const Addressadd2({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Adreescontrollerpart2());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 35, 65),
        title: const Text(
          "عـنـاويـن الـتـوصـيـل",
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
      body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: GetBuilder<Adreescontrollerpart2>(
            builder: (controller) => Handledata(
              statusrequest: controller.statusRequest,
              widget: Center(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 33,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "الرجاء اكمال المعلومات",
                          style: TextStyle(
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    FormFeld(
                        lable: "المدينه",
                        iconData: Icons.location_city_rounded,
                        valid: (val) {
                          return validator(val!, 4, 30, "type");
                        },
                        mycontlloer: controller.city,
                        isNumber: false),
                    SizedBox(
                      height: 20,
                    ),
                    FormFeld(
                        lable: "المنطقه , الشارع , الحي",
                        iconData: Icons.subdirectory_arrow_left_outlined,
                        valid: (val) {
                          return validator(val!, 4, 30, "type");
                        },
                        mycontlloer: controller.street,
                        isNumber: false),
                    SizedBox(
                      height: 20,
                    ),
                    FormFeld(
                        lable: "بيت , عماره , فيلا",
                        iconData: Icons.house_sharp,
                        valid: (val) {
                          return validator(val!, 4, 30, "type");
                        },
                        mycontlloer: controller.home,
                        isNumber: false),
                    SizedBox(
                      height: 20,
                    ),
                    FormFeld(
                        lable: "الاسم الكامل",
                        iconData: Icons.person,
                        valid: (val) {
                          return validator(val!, 4, 30, "type");
                        },
                        mycontlloer: controller.name,
                        isNumber: false),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            controller.addadress();
                          },
                          child: Container(
                            height: 45,
                            width: 280,
                            decoration: BoxDecoration(
                                color: Colors.indigo[900],
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                              child: Text(
                                "انشاء العنوان",
                                style: TextStyle(
                                    fontSize: 19,
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
            ),
          )),
    );
  }
}
