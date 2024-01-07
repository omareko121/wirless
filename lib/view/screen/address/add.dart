// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/controller/address.dart';
import 'package:wirless/core/class/handledata.dart';

class Addressadd extends StatelessWidget {
  const Addressadd({super.key});

  @override
  Widget build(BuildContext context) {
    Adreescontroller controllerpage = Get.put(Adreescontroller());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 35, 65),
          title: const Text(
            "عنواين التوصيل",
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
        body: GetBuilder<Adreescontroller>(
          builder: (controller) => Handledata(
            statusrequest: controller.statusRequest,
            widget: Container(
              child: controller.kGooglePlex == null
                  ? Center(
                      child: Lottie.asset(
                          "assest/lootis/animation_lnt2zzqr.json",
                          height: 220,
                          width: 220))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: controllerpage.markers.toSet(),
                          onTap: (lantlong) {
                            controllerpage.addmarkers(lantlong);
                          },
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            controllerpage.controllers!.complete(controller);
                          },
                        ),
                        Positioned(
                          bottom: 25,
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Container(
                              child: InkWell(
                                onTap: () {
                                  controllerpage.gotopart2();
                                },
                                child: Container(
                                  height: 45,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 4, 65),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      "اكمال العنوان",
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
                      ],
                    ),
            ),
          ),
        ));
  }
}
