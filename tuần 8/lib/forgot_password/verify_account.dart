import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/forgot_password/OTP.dart';

import '../components/Button_Tool.dart';
import '../components/Text_Tool.dart';
import '../resources/color_manager.dart';

class Verify extends StatefulWidget {
  final String? email;
  const Verify({this.email, Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState(email: email);
}

class _VerifyState extends State<Verify> {
  String? email;
  _VerifyState({this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 25,
          ),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  const ListTile(
                    title: Title_Tool(title: 'Confirm your account'),
                    subtitle: Subtitle_Tool(
                        subtitle:
                            'We will send you a code to confirm your account'),
                  ),
                  Expanded(
                      child: CheckBox_Tool(
                          Value: Value1,
                          title: 'Send via SMS',
                          subtitle: '+84*********',
                          onChange: (bool? value) {
                            setState(() {
                              Value1 = value!;
                              Value2 = false;
                            });
                          })),
                  Expanded(
                      child: CheckBox_Tool(
                          Value: Value2,
                          title: 'Send via Email',
                          subtitle: email ?? '************@gmail.com',
                          onChange: (bool? value) {
                            setState(() {
                              Value1 = false;
                              Value2 = value!;
                            });
                          })),
                  const Expanded(
                    flex: 5,
                    child: SizedBox(),
                  )
                ],
              )),
          Button_Tool(
              textColor: Value1 == false && Value2 == false
                  ? color_manager.ktextInactivityColor
                  : color_manager.ktextActivityColor,
              buttonColor: Value1 == false && Value2 == false
                  ? color_manager.kInactivityColor
                  : color_manager.kActivityColor,
              textbutton: 'Next',
              onPressed: () async {
                if (Value1 == false && Value2 == true) {
                  bool sentOtp = await emailAuth.sendOtp(
                      recipientMail: emailContronller.text.toString());
                }
                if (Value1 == true && Value2 == false) {}
                if (Value1 != false || Value2 != false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OTP(
                                email: email,
                                email_value: Value2,
                                phone_value: Value1,
                              )));
                }
              }),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
