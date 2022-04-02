import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/tool/Button.dart';
import 'package:messenger/tool/TextField.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController controller = TextEditingController();
  bool autoFocus = false;
  int num = 20;
  Timer? timer;
  String? textCouter;

  int _counter = 20;
  late Timer _timer;
  void _startTimer() {
    _counter = 20;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
      if (_counter >= 10) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            height: 25,
          ),
          Expanded(
              child: Column(
            children: [
              const Material(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'Pacifico'),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 5,
              ),
              const Material(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Import otp code was sent to',
                    style: TextStyle(
                      color: Color(0xFF8B8B8B),
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Material(
                child: Center(
                  child: Text(
                    'd**************a@gmail.com',
                    style: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontFamily: 'Pacifico',
                        fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              SizedBox(height: 370,),
              ButtonTool(
                  textbutton: 'Resend OTP code later 0:'+ textCouter.toString(),
                  onPressed: _startTimer,
                  buttonColor:
                      _counter == 0 ? kActivityColor : kInactivityColor,
                  textColor: _counter == 0 ? Colors.white : Colors.black),
              Container(
                height: 30,
                color: Colors.white,
              )
            ],
          )),
        ],
      ),
    );
  }
}
