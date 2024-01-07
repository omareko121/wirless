import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/myfavorite_con.dart';
import 'package:wirless/core/class/handledata.dart';
import 'package:wirless/view/Widgets/home/listvewidatafav.dart';

class FavoriteVeiw extends StatelessWidget {
  const FavoriteVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 35, 65),
        title: const Text(
          "المفضلة",
          style: TextStyle(
              fontFamily: 'myfont1',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 39,
          ),
        ),
      ),
        body: GetBuilder<MyFavoriteController>(
      builder: (controller) => ListView(
        children: [
          // homeappbar(
          //   onPressedicon: () {
          //     Navigator.pop(context);
          //   },
          //   onPressed: () {},
          //   icons: Icons.navigate_before,
          // ),
          const SizedBox(
            height: 23,
          ),
          Handledata(
              statusrequest: controller.statusRequest,
              widget: GridView.builder(
                  itemCount: controller.data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.52, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Itemsvewifavorite(
                        itemsmodel: controller.data[index]);
                  }))
        ],
      ),
    ));
  }
}
