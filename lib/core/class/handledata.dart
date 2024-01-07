import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wirless/core/class/statusRequest.dart';

class Handledata extends StatelessWidget {
  final StatusRequest statusrequest;
  final Widget widget;
  const Handledata(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                height: 220, width: 220))
        : statusrequest == StatusRequest.internetfalier
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Lottie.asset(
                          "assest/lootis/animation_loehp3l9.json",
                          height: 250,
                          width: 250)),
                ],
              )
            : statusrequest == StatusRequest.serverfalier
                ?  Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Lottie.asset(
                                  "assest/lootis/serverfalure.json",
                                  height: 300,
                                  width: 300)),
                  
                                  const Text("يبدو ان هناك خطأ غير واضح  , الرجاء اعادة تشغيل الصفحة او الذهاب الى صفحة اخرى ثم العودة" , style: TextStyle(fontSize: 13 , fontFamily: 'myfont1' , fontWeight: FontWeight.bold , color: Color.fromARGB(255, 0, 0, 0)), textAlign: TextAlign.center,)
                        ],
                      ),
                )
                : statusrequest == StatusRequest.falier
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Lottie.asset(
                                "assest/lootis/animation_loeivsut.json",
                                height: 300,
                                width: 300)),

                                const Text("لا يوجد هنا سوى الغبار " , style: TextStyle(fontSize: 25 , fontFamily: 'myfont1' , fontWeight: FontWeight.bold),)
                      ],
                    )
                    : widget;
  }
}
