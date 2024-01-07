// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, avoid_unnecessary_containers, camel_case_types, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/productditils_controoler.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class productditils extends StatelessWidget {
  const productditils({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductditilsControllerImp controller =
        Get.put(ProductditilsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 5, 58),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Hero(
                        tag: "${controller.itemsmodel.itemsId!}",
                        child: Padding(
                          padding: EdgeInsets.all(1),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 1),
                            child: CachedNetworkImage(
                                height: 250,
                                width: 250,
                                imageUrl: AppLink.itemsimgman +
                                    "/" +
                                    controller.itemsmodel.itemsImg!),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.itemsmodel.itemsName!}",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                RatingBar.builder(
                                    initialRating: 5,
                                    maxRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 25,
                                    itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                        ),
                                    onRatingUpdate: (rating) {}),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "( تم الشراء ${controller.itemsmodel.itemsPriceafter! + 97})",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "SAR ${controller.itemsmodel.itemsafterdiscont!.toStringAsFixed(1)}",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          if (controller.itemsmodel.itemsPriceafter != "0")
                            Text(
                              " ${controller.itemsmodel.itemsPrice}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 255, 0, 0)),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        " ${controller.itemsmodel.itemsDesc} 🤍 ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'myfont1',
                            color: Color.fromARGB(255, 0, 0, 0)),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 55,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.addcart(controller.itemsmodel.itemsId!);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                    "اضافه للسلة",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'myfont1',
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed("/cart");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Center(
                      child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
                ),
              )
            ],
          )),
    );
  }
}
