// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wirless/controller/setting_controller.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final Uri _url =
      Uri.parse('https://tawk.to/chat/6544cb17a84dd54dc4881b41/1heabiljl');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {}
  }

  @override
  Widget build(BuildContext context) {
    Settingcontroller controller = Get.put(Settingcontroller());
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 411,
              height: 210,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 0, 21, 39),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 155,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color.fromARGB(255, 0, 29, 56),
                    backgroundImage: AssetImage(
                        "assest/img/—Pngtree—businessman user avatar wearing suit_8385663.png"),
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
              
              
                ListTile(
                  onTap: () {
                    Get.toNamed("/address");
                  },
                  title: Text(
                    "عـنـاويـن الـتـوصـيـل",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.maps_home_work_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed("/orderspanding");
                  },
                  title: Text(
                    "طـلـبـاتـي",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed("/orderarshef");
                  },
                  title: Text(
                    "الـمـحـفـوظـات",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.done_all,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed("/support");
                  },
                  title: Text(
                    "مركز الدعم الفني",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            child: Container(
                              margin: EdgeInsets.only(top: 22),
                              height: 650,
                              child: Column(children: [
                                Text(
                                  " ما هي ويرلس ؟",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "myfont1",
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 4),
                                  child: Text(
                                    "ويرلس ليست مجرد ساعه ويرلس طريقه ب ابراز فخامتك للمجتمع ,, نحن متجر ويرلس .. نبحث عن الجودة التي تليق ب الشخص ونحن نعمل منذ عام 2022/6/15 ولدينا الخبرة الادارية والبرمجية ونطمح لترك بصمه كبيره و واضحه في مجال الاناقه البشريه ولدينا هدف ورؤيه واضحه وهي تطوير بيئه الفخامه ل الاشخاص الذين يحبون التفرد والاناقه - جملتنا الوحيده هي ساعتك جزء من شخصيتك مهمتنا هي انشاء جوده تليق بكم  لدينا دعم فني على مدار 24/7  شعارنا دائما قائم على التعلم والانجاز والابتكار ,, رضى العميل هدفنا وسعاده العميل غايتنا ونسعى دوما لخدمتكم ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "myfont1",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 33, right: 33),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromARGB(
                                              255, 175, 12, 0)),
                                      child: Text(
                                        "اغلاق",
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ))
                              ]),
                            ),
                          );
                        });
                  },
                  title: Text(
                    "مـن هـم ويـرلـس",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.watch_outlined,
                    color: Colors.black,
                    size: 33,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            child: Container(
                              margin: EdgeInsets.only(top: 22),
                              height: 850,
                              child: Column(children: [
                                Text(
                                  "  سـيـاسـه الاسـتـرجـاع",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "myfont",
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 4),
                                  child: Text(
                                    "مع عدم الإخلال بأحكام الضمان الاتفاقية والنظامية، يحق للمستهلك فسخ العقد واسترجاع المنتج المقدّم إليه من المتجر خلال السبعة الأيام التالية لتاريخ استلام المنتج ، ولا يحق له ذلك المنتج بعد مرور السبعة أيام. يشترط لاسترجاع المنتج أن يكون المنتج بحالة سليمة وألا يكون المستهلك قد استخدم المنتج أو حصل على منفعته، ويحق للمتجر معاينة المنتج قبل استرجاعه للتأكد من سلامته يتحمل المستهلك التكاليف المترتبة على عملية الاسترجاع وفي حالة الاسترجاع الدولي يتحمل المستهلك كامل تكاليف الشحن وتسليم المنتج لشركة الشحن وفي حال وجود عيوب أو خطأ سيتم تعويض المستهلك ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "myfont1",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 33, right: 33),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromARGB(
                                              255, 175, 12, 0)),
                                      child: Text(
                                        "اغلاق",
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ))
                              ]),
                            ),
                          );
                        });
                  },
                  title: Text(
                    "سـيـاسـه الاسـتـرجـاع",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.reply_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              child: Container(
                                margin: EdgeInsets.only(top: 22),
                                height: 700,
                                child: Column(children: [
                                  Text(
                                    "سـيـاسـه الاسـتـبـدال ",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontFamily: "name1",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 4, right: 4),
                                    child: Text(
                                      " لا يحق للمستهلك استبدال المنتج في الحالات التالية: إذا كان المنتج تم تصنيعه بناءً على طلب المستهلك أو وفقاً لمواصفات حدّدها، ويستثنى من ذلك المنتجات التي بها عيب أو التي خالفت المواصفات المحدّدة من قبل المستهلك , م دون ذالك يتم الاستبدال من يوم الى 7 ايام م زاد او نقص فلا يتم الاستبدال ويرجى العلم انه اذا كان المنتج به عيب من سوء استعمال العميل فلا يستبدل نهائيا ولا الاسترجاع ابدا نتمنى من الجميع الالتزام ب الشروط الخاصه ب متجرنا ل ضمان خدمتك ب افضل طريقه ممكنه ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "myfont1",
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 33, right: 33),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 175, 12, 0)),
                                        child: Text(
                                          "اغلاق",
                                          style: TextStyle(
                                              fontFamily: 'myfont1',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ))
                                ]),
                              ),
                            ),
                          );
                        });
                  },
                  title: Text(
                    "سـيـاسـه الاسـتـبـدال ",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.repeat,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            child: Container(
                              margin: EdgeInsets.only(top: 22),
                              height: 900,
                              child: Column(children: [
                                Text(
                                  " سـيـاسـه الـخـصـوصـيـه",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "",
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 4),
                                  child: Text(
                                    "متجرنا الالكتروني يرحّب بكم ويبلغكم بأنكم سوف تجدون أدناه الشروط والأحكام المُنظّمة لاستخدامكم لهذا المتجر وكافة الآثار القانونية التي تنتج عن إستخدامكم لخدمات المتجر عبر الشبكة العنكبوتية عبر هذه المنصة الالكترونية، حيث أن استخدام أي شخصٍ كان للمتجر سواءً كان مستهلكاً لخدمة أو لمنتج المتجر أو غير ذلك فإن هذا موافقة وقبول منه وهو بكامل أهليته المعتبرة شرعاً ونظاماً وقانوناً لكافة مواد وأحكام هذه الاتفاقية وهو تأكيد لالتزامكم بأنظمتها ولما ذُكر فيها، وتسري هذه الاتفاقية على جميع أنواع التعامل بين المستهلك وبيننا وتعتبر هذه الاتفاقية سارية المفعول ونافذة بمجرد قيامكم بالموافقة عليها والبدء في التسجيل بالمتجر بموجب المادة العاشرة من نظام التعاملات الإلكترونية السعودي  ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "myfont1",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 33, right: 33),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromARGB(
                                              255, 175, 12, 0)),
                                      child: Text(
                                        "اغلاق",
                                        style: TextStyle(
                                            fontFamily: 'myfont1',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ))
                              ]),
                            ),
                          );
                        });
                  },
                  title: Text(
                    "سـيـاسـه الـخـصـوصـيـه",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.lock_person,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            backgroundColor: Colors.white,
                            child: Container(
                              height: 240,
                              width: double.infinity,
                              margin:
                                  EdgeInsets.only(top: 20, left: 4, right: 4),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " هل انت متاكد انك تريد تسجيل الخروج ؟ ",
                                      style: TextStyle(
                                          fontFamily: 'myfont1',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                controller.logout();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 33, right: 33),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: Colors.red[800]),
                                                child: Text(
                                                  "نعم",
                                                  style: TextStyle(
                                                      fontFamily: 'myfont1',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
                                                ),
                                              )),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: Color.fromARGB(
                                                        255, 18, 153, 18)),
                                                padding: EdgeInsets.only(
                                                    left: 33, right: 33),
                                                child: Text(
                                                  "لا",
                                                  style: TextStyle(
                                                      fontFamily: 'myfont1',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  title: Text(
                    "تـسـجـيـل الـخـروج",
                    style: TextStyle(
                        fontFamily: 'myfont1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.logout,
                    color: Colors.red[800],
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
