// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wirless/core/class/statusRequest.dart';

class Adreescontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? controllers;

  List<Marker> markers = [];

  double? lat ;
  double? long ;

  addmarkers(LatLng latlang) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlang));
    lat = latlang.latitude;
    long = latlang.longitude;
    update();
  }

  gotopart2() {
    Get.toNamed("/addressaddpart2" , arguments: {
      'lat': lat.toString(),
      'long':long.toString(),
    });
  }

  Position? posion;

  CameraPosition? kGooglePlex;

  CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  getlocationpermieetion() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      permission = await Geolocator.requestPermission();
    }
  }

  getlocation() async {
    await getlocationpermieetion();
    posion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(posion!.latitude, posion!.longitude),
      zoom: 14.4746,
    );

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getlocationpermieetion();
    getlocation();
    controllers = Completer<GoogleMapController>();
    super.onInit();
  }
}
