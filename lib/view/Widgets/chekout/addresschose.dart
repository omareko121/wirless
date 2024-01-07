// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseAdress extends StatelessWidget {
  final String Title;
  final String suptitle;
  final bool isActive;
  const ChooseAdress({super.key, required this.Title, required this.suptitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Card(
        color: isActive? Color.fromARGB(246, 0, 43, 77) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
            padding: EdgeInsets.only(top: 12, bottom: 12, right: 1, left: 1),
            child: ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: isActive? Colors.white : Colors.black,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    Title,
                    style: TextStyle(
                        fontFamily: 'Myfont1',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: isActive? Colors.white : Colors.black),
                  ),
                ],
              ),
              subtitle: Row(children: [
                Text(
                  suptitle,
                  style: TextStyle(
                      fontFamily: 'Myfont1',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isActive? Colors.white : Colors.black),
                )
              ]),
            )),
      ),
    );
  }
}
