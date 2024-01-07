// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/view/Widgets/home/butoonorder.dart';

import '../../controller/cart_controller.dart';

class Buttomnavicart extends StatelessWidget {
  final TextEditingController controllercoupon;
  const Buttomnavicart({super.key, required this.controllercoupon});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Colors.white),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: controllercoupon,
                    decoration: InputDecoration(
                        hintText: "لديك كوبون خصم ؟",
                        hintStyle: TextStyle(
                          fontFamily: 'myfont1',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        border: OutlineInputBorder()),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        controller.getcoupon();
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 9, 13, 65),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12))),
                        child: Center(
                          child: Text(
                            "تطبيق",
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
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 0, 45, 82), width: 2),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("SAR ${controller.priceOrders}",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 0, 128))),
                    Text("السعر",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("SAR 0",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 0, 128))),
                    Text("الخصم",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("مجاني",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 0, 128))),
                    Text("مبلغ التوصيل",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                Divider(
                  color: const Color.fromARGB(255, 0, 40, 73),
                  height: 20,
                  thickness: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("SAR ${controller.priceOrders}",
                        style: TextStyle(
                            fontFamily: 'myfont1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 0, 128))),
                    Text(
                      "المبلغ الاجمالي",
                      style: TextStyle(
                          fontFamily: 'myfont1',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtounOrder(),
        ],
      ),
    );
  }
}
