import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/forgot_password/Update_password.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../components/Button_Tool.dart';
import '../components/Text_Tool.dart';
import '../resources/color_manager.dart';

class OTP extends StatefulWidget {
  final String? email;
  final bool? email_value, phone_value;
  const OTP({this.email, this.email_value, this.phone_value, Key? key})
      : super(key: key);

  @override
  State<OTP> createState() => _OTPState(
      email: email, email_value: email_value, phone_value: phone_value);
}

class _OTPState extends State<OTP> {
  String? email;
  bool? email_value, phone_value;
  _OTPState({this.email, this.email_value, this.phone_value});
  TextEditingController controller = TextEditingController();
  bool autoFocus = false;
  int num = 20;
  Timer? timer;
  String? textCouter;

  int _counter = 60;
  late Timer _timer;
  void _startTimer() {
    _counter = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
      if (_counter > 9) {
        textCouter = _counter.toString();
      } else {
        textCouter = '0$_counter';
      }
    });
  }

  @override
  void initState() {
    _startTimer();
  }

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
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        ListTile(
                          title: Title_Tool(title: 'Forgot password'),
                          subtitle: Subtitle_Tool(
                            subtitle: 'Import otp code was sent to',
                          ),
                        ),
                        Subtitle_Tool(subtitle: 'd**************a@gmail.com'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 40,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                        if (emailAuth.validateOtp(
                            recipientMail:
                                email ?? 'doanphamdangkhoa@gmail.com',
                            userOtp: pin)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Update(email: email,)));
                        }
                      },
                    ),
                  ),
                ],
              )),
          Button_Tool(
              textbutton: 'Resend OTP code later 0:$textCouter',
              onPressed: () {
                setState(() async {
                  initState();
                  if (_counter == 0) {
                    bool sentAgan = await emailAuth.sendOtp(
                        recipientMail: email ?? 'doanphamdangkhoa@gmai.com',
                        otpLength: 6);
                  }
                });
              },
              buttonColor: _counter == 0
                  ? color_manager.kActivityColor
                  : color_manager.kInactivityColor,
              textColor: _counter == 0
                  ? color_manager.ktextActivityColor
                  : color_manager.ktextInactivityColor),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
