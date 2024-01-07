// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/home_controller.dart';
import 'package:wirless/controller/offers.dart';
import 'package:wirless/core/class/handledata.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/view/Widgets/appbar.dart';
import 'package:wirless/view/Widgets/items.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Homepage extends GetView<Homecontrollerimb> {
  const Homepage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(Homecontrollerimb());
    Get.put(Offerscontrlloer());

    return ListView(children: [
      homeappbar(
        onPressedicon: () {
          Get.toNamed("/favoriteVeiw");
        },
        onPressed: () {
          controller.OnSearch();
        },
        icons: Icons.favorite_border,
        mycontroller: controller.search!,
        onChanged: (val) {
          controller.Checksearch(val);
        },
      ),
      SizedBox(
        height: 10,
      ),
      GetBuilder<Homecontrollerimb>(
          builder: (controller) => Handledata(
              statusrequest: controller.statusRequest,
              widget: controller.isSearch
                  ? Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ListSearch(
                        listmode: controller.itemsdata,
                      ),
                    )
                  : Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    " Palestinian Lives Matter. We Stand With Palestine",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: 'myfont1',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assest/img/free.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GridView.builder(
                            itemCount: controller.imghome.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.87, crossAxisCount: 1),
                            itemBuilder: ((context, index) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  height: 210,
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              child: CachedNetworkImage(
                                                imageUrl: '${AppLink.imghome}/${controller.imghome[index]['imgname']}',
                                              ))),
                                    ],
                                  ),
                                ),
                              );
                            })),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_checkout_sharp,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "اقسام المنتجات",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          height: 120,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            itemCount: controller.categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  controller.gtoitems(
                                      controller.categories,
                                      index,
                                      controller.categories[index]
                                              ['categories_id']
                                          .toString());
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 0, 8, 56),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 70,
                                      width: 70,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${AppLink.catagorisimg}/${controller.categories[index]['categories_img']}",
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${controller.categories[index]['categories_name']}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'myfont1',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 0, 34, 61),
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "افضل المنتجات",
                                    style: TextStyle(
                                        fontFamily: 'myfont1',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GetBuilder<Offerscontrlloer>(
                            builder: (controller) => GridView.builder(
                                    itemCount: controller.data.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.52,
                                            crossAxisCount: 2),
                                    itemBuilder: ((context, index) {
                                      return itemshome(
                                          itemsmodel: controller.data[index]);
                                    })))
                      ],
                    )))
    ]);
  }
}

class ListSearch extends GetView<Homecontrollerimb> {
  final List<Itemsmodel> listmode;
  const ListSearch({super.key, required this.listmode});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listmode.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goTopageitemsditils(listmode[index]);
          },
          child: Card(
            child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${AppLink.itemsimgman}/${listmode[index].itemsImg}',
                        height: 120,
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                      flex: 4,
                      child: ListTile(
                          title: Text(
                            "${listmode[index].itemsName}",
                            style: TextStyle(
                                fontFamily: 'myfont1',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text("${listmode[index].categoriesName}",
                              style: TextStyle(
                                  fontFamily: 'myfont1',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 29, 0, 109))))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
