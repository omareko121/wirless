// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cartpaymentmethod extends StatelessWidget {
  final String TiTle;
  final IconData icon;
  // ignore: non_constant_identifier_names
  final bool Isactive;
  const Cartpaymentmethod(
      {super.key,
      required this.TiTle,
      required this.Isactive,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Isactive
              ? Color.fromARGB(255, 25, 61, 90)
              : Color.fromARGB(43, 100, 99, 99)),
      child: Row(
        children: [
          Icon(icon,
              size: 30,
              color: Isactive
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : Colors.black),
          SizedBox(
            width: 10,
          ),
          Text(TiTle,
              style: TextStyle(
                  fontFamily: 'Myfont1',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Isactive
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : Colors.black))
        ],
      ),
    );
  }
}
