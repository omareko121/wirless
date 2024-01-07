// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/controller/checkoutcontroller.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/data/Models/payment_stripemodel/payment_intent.dart';
import 'package:wirless/data/manger/cubit/payment_cubit.dart';
import 'package:wirless/data/repose/imp.dart';
import 'package:wirless/payment/list.dart';
import 'package:wirless/view/Widgets/chekout/addresschose.dart';
import 'package:wirless/view/Widgets/chekout/buttom.dart';
import 'package:wirless/view/Widgets/chekout/cardpayment.dart';

CheckoutController controller = Get.put(CheckoutController());

class CheckOUT extends StatefulWidget {
  const CheckOUT({super.key});

  @override
  State<CheckOUT> createState() => _CheckOUTState();
}

class _CheckOUTState extends State<CheckOUT> {
  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.white),
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Container(
                child: InkWell(
                  onTap: () async {
                    // controller.checkout();
                    // Get.toNamed("/PaymentScreen");
                    if (controller.addressid == null) {
                      Get.snackbar(
                          "خطأ ", "عزيزي الرجاء اختيار طريقة دفع وعنوان صحيح",
                          messageText: const Text(
                            "عزيزي الرجاء اختيار طريقة دفع وعنوان صحيح",
                            style: TextStyle(
                                fontFamily: 'myfont1',
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          titleText: const Text(
                            "data",
                            style: TextStyle(fontSize: 0),
                          ));
                    } else if (controller.paymentMethod == null) {
                      Get.snackbar(
                          "خطأ ", "عزيزي الرجاء اختيار طريقة دفع وعنوان صحيح",
                          messageText: const Text(
                            "عزيزي الرجاء اختيار طريقة دفع وعنوان صحيح",
                            style: TextStyle(
                                fontFamily: 'myfont1',
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          titleText: const Text(
                            "data",
                            style: TextStyle(fontSize: 0),
                          ));
                    } else {
                      if (controller.paymentMethod == "PayPal") {
                        print(controller.totalPrice);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckoutView(
                            sandboxMode: false,
                            clientId:
                                "AVa12lmlbTYODq7G9Iv_nDKKZmzHV_6lc1PpoSq8EYMuvVxBc14t7uDSu2g_M-DB5KjKVAZrW1qi_fwB",
                            secretKey:
                                "ENprUQbFWBXz8TLayuwOHiOe2WuS3aHMZG17JfK2DBSahvhSjNyj8HA8kOAsM_5IdHRgpp_pxLeog2_8",
                            transactions: [
                              {
                                "amount": {
                                  "total": '${controller.totalPrice}',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '${controller.totalPrice}',
                                    "shipping": '0',
                                    "shipping_discount": '0'
                                  }
                                },
                                "description":
                                    "احنا موجودين معك خطوه بخطوه لين نتاكد ان الساعة صارت بالفعل على يدك لا تنسى تتواصل معانا دايما",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Watch",
                                      "quantity": '1',
                                      "price": '${controller.totalPrice}',
                                      "currency": "USD"
                                    },
                                  ],

                                  // Optional
                                  //   "shipping_address": {
                                  //     "recipient_name": "Tharwat samy",
                                  //     "line1": "tharwat",
                                  //     "line2": "",
                                  //     "city": "tharwat",
                                  //     "country_code": "EG",
                                  //     "postal_code": "25025",
                                  //     "phone": "+00000000",
                                  //     "state": "ALex"
                                  //  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              Navigator.pop(context);
                              controller.checkout();
                            },
                            onError: (error) {
                              print("onError: $error");
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              print('cancelled:');
                              Navigator.pop(context);
                            },
                          ),
                        ));
                      } else if (controller.paymentMethod == "Credit Card") {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16))),
                            builder: (context) {
                              return BlocProvider(
                                create: (context) => PaymentCubit(imp()),
                                child: PaymentMethodsBottomSheet(),
                              );
                            });
                      }
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 9, 13, 65),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "اكمال الطلب",
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
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "اكمال الطلب",
              style: TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.navigate_next,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        leading: Icon(
          Icons.local_activity,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(
                child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                    height: 220, width: 220))
            : controller.statusRequest == StatusRequest.falier
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Lottie.asset(
                              "assest/lootis/animation_loeivsut.json",
                              height: 300,
                              width: 300)),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "عزيزي الرجاء اضافة عنوان توصيل",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'myfont1',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed("/address");
                            },
                            child: Text(
                              "اضغط هنا",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'myfont1',
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 59, 107)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Container(
                    margin: EdgeInsets.all(20),
                    child: ListView(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.payment,
                            size: 32,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "اختر وسيلة الدفع",
                            style: TextStyle(
                                fontFamily: 'myfont1',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("PayPal");
                          },
                          child: Cartpaymentmethod(
                            TiTle: 'PayPal',
                            Isactive: controller.paymentMethod == "PayPal"
                                ? true
                                : false,
                            icon: Icons.paypal,
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("Credit Card");
                        },
                        child: Cartpaymentmethod(
                          TiTle: 'Credit Card',
                          Isactive: controller.paymentMethod == "Credit Card"
                              ? true
                              : false,
                          icon: Icons.payment,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 32,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "اختر عنوان التوصيل",
                            style: TextStyle(
                                fontFamily: 'myfont1',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(
                                "${controller.dataaddress[index].addressId}");
                          },
                          child: ChooseAdress(
                            Title:
                                "${controller.dataaddress[index].addressName}",
                            isActive: controller.addressid ==
                                    controller.dataaddress[index].addressId
                                ? true
                                : false,
                            suptitle:
                                '${controller.dataaddress[index].addressCity} - ${controller.dataaddress[index].addressStreet}',
                          ),
                        ),
                      )
                    ]),
                  ),
      ),
    );
  }
}

class PaymentMethdcom extends StatefulWidget {
  const PaymentMethdcom({super.key});

  @override
  State<PaymentMethdcom> createState() => _PaymentMethdcomState();
}

class _PaymentMethdcomState extends State<PaymentMethdcom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Text(
            "اختيار طريقة دفع",
            style: TextStyle(
                fontFamily: 'myfont1',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black),
          )),
          SizedBox(
            height: 40,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Container(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 9, 13, 65),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "اتمام الطلب",
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
        ],
      ),
    );
  }
}

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          Costumbuttomcounsemer(),
        ],
      ),
    );
  }
}

class Costumbuttomcounsemer extends StatelessWidget {
  const Costumbuttomcounsemer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is Paymentsuccses) {
          Navigator.pop(context);
          controller.checkout();
        }

        if (state is PaymentFailure) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                      amount: controller.totalPriceSAR!, currency: 'SAR');
              BlocProvider.of<PaymentCubit>(context).makepayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoding: state is Paymentloding ? true : false,
            text: 'اتمام الدفع');
      },
    );
  }
}
