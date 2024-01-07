// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/cart_controller.dart';
import 'package:wirless/core/class/handledata.dart';

import 'package:wirless/view/thetop/linkapi.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "سله التسوق",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.navigate_next,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        leading: Icon(
          Icons.local_activity,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => Handledata(
                statusrequest: controller.statusRequest,
                widget: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white),
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GetBuilder<CartController>(
                          builder: (controller) => controller.couponname == null
                              ? Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: TextFormField(
                                              controller:
                                                  controller.controllercoupon,
                                              decoration: InputDecoration(
                                                  hintText: "لديك كوبون خصم ؟",
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'myfont1',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 8,
                                                          horizontal: 15),
                                                  border: OutlineInputBorder()),
                                            )),
                                        Expanded(
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
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              9,
                                                              13,
                                                              65),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(12),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                  child: Center(
                                                    child: Text(
                                                      "تطبيق",
                                                      style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'myfont1'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.green[800],
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      " ( ${controller.couponname} ) الكوبون المستخدم ",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          color: const Color.fromARGB(
                                              255, 0, 47, 85),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 0, 45, 82),
                                width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    "SAR ${controller.priceOrders.toStringAsFixed(0)}",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 38, 0, 128))),
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
                                Text("${controller.discountcoupon}%",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 38, 0, 128))),
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
                                        color:
                                            Color.fromARGB(255, 38, 0, 128))),
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
                                Text(
                                    "SAR ${controller.getTotalPrice().toStringAsFixed(0)}",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 38, 0, 128))),
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
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              controller.gotocheckout();
                              // Get.toNamed("pagevisa");
                            },
                            child: Container(
                              height: 45,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 9, 13, 65),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: Text(
                                  "اكمال الطلب",
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
              )),
      body: GetBuilder<CartController>(
        builder: (controller) => ListView(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            height: 40,
            width: 30,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 39, 71),
                borderRadius: BorderRadius.circular(33)),
            child: Center(
                child: Text(
              "عزيزي يوجد لديك في سله التسوق  ${controller.totalcountitems}  من المنتجات",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ...List.generate(
                  controller.data.length,
                  (index) => Card(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${AppLink.itemsimgman}/${controller.data[index].itemsImg}',
                                height: 110,
                                fit: BoxFit.cover,
                              )),
                          Expanded(
                              flex: 4,
                              child: ListTile(
                                title: Text(
                                  "${controller.data[index].itemsName}",
                                  style: TextStyle(
                                      fontFamily: 'myfont1',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                    "SAR ${controller.data[index].itemsprice2!.toStringAsFixed(1)}",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 29, 0, 109))),
                              )),
                          Expanded(
                              child: Column(
                            children: [
                              Container(
                                height: 43,
                                child: IconButton(
                                    onPressed: () async {
                                      await controller.addcart(controller
                                          .data[index].itemsId!
                                          .toString());
                                      controller.refreshpage();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 25,
                                    )),
                              ),
                              Text(
                                "${controller.data[index].countitems}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                height: 43,
                                child: IconButton(
                                    onPressed: () async {
                                      await controller.reomveFromCart(controller
                                          .data[index].itemsId!
                                          .toString());
                                      controller.refreshpage();
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 25,
                                    )),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
