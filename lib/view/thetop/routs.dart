// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:wirless/core/medele/mymedele.dart';
import 'package:wirless/payment/paymentThankYou.dart';
import 'package:wirless/support_wirless.dart';
import 'package:wirless/view/productdit/product.dart';
import 'package:wirless/view/screen/address/addpart2.dart';
import 'package:wirless/view/screen/address/address.dart';
import 'package:wirless/view/screen/address/add.dart';
import 'package:wirless/view/screen/cart.dart';
import 'package:wirless/view/screen/checkout.dart';
import 'package:wirless/view/screen/favscreen.dart';
import 'package:wirless/view/screen/homescreen.dart';
import 'package:wirless/view/screen/items.dart';
import 'package:wirless/view/screen/orders/arshef.dart';
import 'package:wirless/view/screen/orders/orders.dart';
import 'package:wirless/view/screen/orders/ditiles.dart';
import 'package:wirless/view/screen/suc2.dart';
import 'package:wirless/view/screen/suc3.dart';
import 'package:wirless/view/screen/sucpay.dart';
import 'package:wirless/view/screen/sucses.dart';
import 'package:wirless/view/screen/Onbording.dart';
import 'package:wirless/view/screen/auth/checkemail.dart';
import 'package:wirless/view/screen/auth/resetpaswword/forgetpaswword.dart';
import 'package:wirless/view/screen/auth/login.dart';
import 'package:wirless/view/screen/auth/resetpaswword/resetpaswword.dart';
import 'package:wirless/view/screen/auth/sginin.dart';
import 'package:wirless/view/screen/auth/resetpaswword/success.dart';
import 'package:wirless/view/screen/auth/success_sginup.dart';
import 'package:wirless/view/screen/auth/resetpaswword/verevi.dart';
import '../../data/Models/catogris.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Onbording(), middlewares: [Mymedele()]),
  GetPage(name: "/succesful", page: () => const succesful()),
  GetPage(name: "/succesfulpay", page: () => const succesfulpayment()),
  GetPage(name: "/succesful2", page: () => const suctow()),
  GetPage(name: "/succesful3", page: () => const succesful3()),
  GetPage(name: "/homepage", page: () => const HomeScreen()),
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/sginup", page: () => const Sginup()),
  GetPage(name: "/forgetp", page: () => const ForgetPaswwored()),
  GetPage(name: "/vcode", page: () => const Virevaycode()),
  GetPage(name: "/restep", page: () => const Resetpaswword()),
  GetPage(name: "/SuccssufulSginup", page: () => const successSginup()),
  GetPage(name: "/Succssufulresetpas", page: () => const successresetpas()),
  GetPage(name: "/checEmail", page: () => const ChecEmail()),
  GetPage(name: "/items", page: () =>  Items(categoriesModel: Catigoris())),
  GetPage(name: "/productditils", page: () =>  productditils()),
  GetPage(name: "/favoriteVeiw", page: () =>  FavoriteVeiw()),
  GetPage(name: "/cart", page: () =>  Cart()),
  GetPage(name: "/support", page: () =>  Support()),
  GetPage(name: "/address", page: () =>  Addresspage()),
  GetPage(name: "/addressadd", page: () =>  Addressadd()),
  GetPage(name: "/addressaddpart2", page: () =>  Addressadd2()),
  GetPage(name: "/CheckOUT", page: () =>  CheckOUT()),
  GetPage(name: "/orderspanding", page: () =>  Orderspanding()),
  GetPage(name: "/ordersditiles", page: () =>  Ordersditles()),
  GetPage(name: "/orderarshef", page: () =>  Orderarshef()),
  GetPage(name: "/ThankYouPayment", page: () =>  ThankYouPayment()),
  // GetPage(name: "/", page: () =>  momo()),
  // GetPage(name: "/", page: () =>  tappayment()),
];
