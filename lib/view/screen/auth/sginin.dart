// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless/controller/auth/sginup.dart';
import 'package:wirless/core/class/statusRequest.dart';
import 'package:wirless/core/function/aleretExit.dart';
import 'package:wirless/core/function/validator.dart';
import 'package:wirless/view/Widgets/auth/formfeld.dart';

class Sginup extends StatelessWidget {
  const Sginup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Sginuocontrollerimb cobtroller = Get.put(Sginuocontrollerimb());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'انشاء حساب',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'myfont1',
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: WillPopScope(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Form(
                key: cobtroller.formstate,
                child: ListView(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "اهلا بك عزيزي",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'myfont1',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "هنا ويرلس حيث يمكنك ان تجد سر الاناقه والفخامه ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'myfont1',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  FormFeld(
                    isNumber: false,
                    valid: (val) {
                      return validator(val!, 5, 100, "email");
                    },
                    iconData: Icons.email_outlined,
                    lable: 'البريد الالكتروني',
                    mycontlloer: cobtroller.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormFeld(
                    isNumber: true,
                    valid: (val) {
                      return validator(val!, 5, 20, "phone");
                    },
                    iconData: Icons.phone,
                    lable: 'رقم الهاتف',
                    mycontlloer: cobtroller.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormFeld(
                    isNumber: false,
                    valid: (val) {
                      return validator(val!, 5, 30, "password");
                    },
                    iconData: Icons.person,
                    lable: 'الاسم الكامل',
                    mycontlloer: cobtroller.username,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<Sginuocontrollerimb>(
                    builder: (contlloer) => FormFeld(
                      isNumber: false,
                      valid: (val) {
                        return validator(val!, 5, 30, "password");
                      },
                      Visiablity: contlloer.isvis,
                      onTap: () {
                        contlloer.showpassword();
                      },
                      iconData: contlloer.isvis
                          ? Icons.visibility_off
                          : Icons.visibility,
                      lable: 'كلمه المرور',
                      mycontlloer: contlloer.Paswword,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      onPressed: () {
                        cobtroller.sginup();
                      },
                      color: Colors.indigo[700],
                      textColor: Colors.white,
                      child: GetBuilder<Sginuocontrollerimb>(
                        builder: (controller) => 
                        controller.statusRequest == StatusRequest.loading ?
                        Center(
                         child: CircularProgressIndicator(
                          color: Colors.white,
                          
                        ))
                        :
                        Text(
                          "انشاء حساب",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            cobtroller.Logintopage();
                          },
                          child: Text(
                            "تسجيل الدخول ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.indigo[900],
                                fontFamily: 'myfont1',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "لديك حساب بالفعل ؟",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'myfont1',
                              fontWeight: FontWeight.bold),
                        ),
                      ])
                ]),
              ),
            ),
            onWillPop: aleartExit));
  }
}
