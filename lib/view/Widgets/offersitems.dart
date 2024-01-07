// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_single_cascade_in_expression_statements, unused_element, unnecessary_import, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/controller_favorite.dart';
import 'package:wirless/controller/offers.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Offersscreen extends StatelessWidget {
  final Itemsmodel itemsmodel;
  // final bool active;
  const Offersscreen({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(Offerscontrlloer());
    Get.put(FavoriteController());
    return GetBuilder<Offerscontrlloer>(
        builder: (controller) => InkWell(
              onTap: () {
                controller.goTopageitemsditils(itemsmodel);
              },
              child: Container(
                margin: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 4,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: itemsmodel.itemsPriceafter! >= 50
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                      children: [
                        if (itemsmodel.itemsPriceafter! >= 50)
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 49, 2, 108),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12))),
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Text(
                                "${itemsmodel.itemsPriceafter}%  خصم",
                                style: TextStyle(
                                    fontFamily: 'myfont1',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        Center(
                            child: GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsmodel.itemsId] ==
                                    "yes") {
                                  controller.setfavorite(
                                      itemsmodel.itemsId, "no");
                                  controller.removefavorite(
                                      itemsmodel.itemsId!.toString());
                                } else {
                                  controller.setfavorite(
                                      itemsmodel.itemsId, "yes");
                                  controller.addfavorite(
                                      itemsmodel.itemsId!.toString());
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsmodel.itemsId] ==
                                        "yes"
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red[800],
                                size: 35,
                              )),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: "${itemsmodel.itemsId!}",
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.itemsimgman}/${itemsmodel.itemsImg!}",
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            itemsmodel.itemsName!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "  🤍  الافضل - الاجمل - الارخص - فقط من اجلك",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'myfont1'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
