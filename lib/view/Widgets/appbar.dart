// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeappbar extends StatelessWidget {
  final void Function()? onPressedicon;
  final void Function()? onPressed;
  final IconData icons;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const homeappbar(
      {super.key,
      this.onPressedicon,
      this.onPressed,
      required this.icons,
      required this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          onChanged: onChanged,
          controller: mycontroller,
          decoration: InputDecoration(
            
              suffixIcon: IconButton(
                  onPressed: onPressed, icon: Icon(Icons.search_sharp)),
              hintText: "  ابحث عن اختيارك الامثل",
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: "myfont1",
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)),
              filled: true,
              fillColor: Colors.grey[300]),
        )),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: IconButton(
              onPressed: onPressedicon,
              icon: Icon(icons, size: 35, color: Colors.grey[600])),
        )
      ]),
    );
  }
}
