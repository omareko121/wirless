// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/controller_favorite.dart';
import 'package:wirless/controller/home_controller.dart';
import 'package:wirless/controller/items_controller.dart';
import 'package:wirless/core/class/handledata.dart';
import 'package:wirless/data/Models/catogris.dart';
import 'package:wirless/data/Models/items.dart';
import 'package:wirless/view/Widgets/appbar.dart';
import 'package:wirless/view/Widgets/item_home.dart';
import 'package:wirless/view/thetop/linkapi.dart';

class Items extends StatelessWidget {
  const Items({super.key, required this.categoriesModel});
  final Catigoris categoriesModel;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemscontrolerImp());
    FavoriteController controllerfavorite = Get.put(FavoriteController());

    return Scaffold(
      body: GetBuilder<ItemscontrolerImp>(
        builder: (controller) => ListView(
          children: [
            homeappbar(
              onPressedicon: () {
                Navigator.pop(context);
              },
              onPressed: () {
                controller.OnSearch();
              },
              icons: Icons.navigate_before,
              mycontroller: controller.search!,
              onChanged: (val) {
                controller.Checksearch(val);
              },
            ),
            GetBuilder<ItemscontrolerImp>(
              builder: (controller) => Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    height: 100,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: controller.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            //  controller.gtoitems(controller.categories, index);
                            controller.changecat(
                                index,
                                controller.categories[index]['categories_id']
                                    .toString());
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 7, bottom: 5, top: 3),
                                decoration: controller.selctedCat == index
                                    ? BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                        width: 4,
                                        color: Color.fromARGB(255, 0, 8, 56),
                                      )))
                                    : null,
                                child: Text(
                                  "${controller.categories[index]['categories_name']}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'myfont1',
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  GetBuilder<ItemscontrolerImp>(
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
                                          childAspectRatio: 0.52,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    controllerfavorite.isFavorite[controller
                                            .data[index]['items_id']] =
                                        controller.data[index]['favorite'];
                                    return Itemsvewi(
                                      itemsmodel: Itemsmodel.fromJson(
                                          controller.data[index]),
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
