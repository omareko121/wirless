// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/controller_favorite.dart';
import 'package:wirless/controller/home_controller.dart';
import 'package:wirless/controller/offers.dart';
import 'package:wirless/core/class/handledata.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/view/Widgets/appbar.dart';
import 'package:wirless/view/Widgets/offersitems.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Offerscontrlloer());
    Get.put(FavoriteController());

    return Scaffold(
      body: GetBuilder<Offerscontrlloer>(
        builder: (controller) => ListView(
          children: [
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
            GetBuilder<Offerscontrlloer>(
              builder: (controller) => Column(
                children: [
                  GetBuilder<Offerscontrlloer>(
                      builder: (controller) => Handledata(
                          statusrequest: controller.statusRequest,
                          widget: controller.isSearch
                              ? ListSearch(
                                  listmode: controller.itemsmodeldata,
                                )
                              : GridView.builder(
                                  itemCount: controller.data.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.75,
                                          crossAxisCount: 1),
                                  itemBuilder: (context, index) {
                                    return Offersscreen(
                                      itemsmodel: controller.data[index],
                                    );
                                  })))
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                                color: Color.fromARGB(255, 29, 0, 109))),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
