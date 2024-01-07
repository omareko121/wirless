import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:wirless/core/function/checkinternet.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;

  inialdata() async {
    res = await Checinternet();
    print(res);
  }

  @override
  void initState() {
    inialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 200),
        child: ListView(
          children: [
            Center(
              child: OtpTextField(
                fieldWidth: 55,
                borderRadius: BorderRadius.circular(12),
                margin: EdgeInsets.only(left: 15),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
            ),
          ],
        ),
      ),
    );
  }
}
