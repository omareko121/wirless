// ignore_for_file: prefer_const_constructors, deprecated_member_use, await_only_futures, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:wirless/apistripe.dart';
import 'package:wirless/controller/main.dart';
import 'package:wirless/view/thetop/routs.dart';
import 'package:wirless/bindinges/binding.dart';
import 'package:wirless/core/EandA/tra.dart';
import 'package:wirless/core/serve/serveise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServese();
  Stripe.publishableKey = ApiStripe.paymentpubkey;
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCg7y3kTgwJsWdEwAiD1gBTP-vHPtQ8gjo",
            authDomain: "wirless-app-2c51e.firebaseapp.com",
            projectId: "wirless-app-2c51e",
            storageBucket: "wirless-app-2c51e.appspot.com",
            messagingSenderId: "395068846118",
            appId: "1:395068846118:web:343af3fe2afa85108936e7"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Myserveses());
    Maincontroller controller = Get.put(Maincontroller());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme()),
      // home: const Onbording(),
      initialBinding: Ininilbindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
