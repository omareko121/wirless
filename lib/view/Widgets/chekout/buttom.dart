import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,  this.isLoding = false,
  });

  final void Function()? onTap;

  final String text;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 0, 1, 59),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoding? Center(
            child: Lottie.asset("assest/lootis/animation_lnt2zzqr.json",
                height: 300, width: 300)) : Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'myfont1'),
          ),
        ),
      ),
    );
  }
}
