import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/tool/Button.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  bool Value1 = false;
  bool Value2 = false;

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
                    'Confirm your account',
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
                    'We will send you a code to confirm your account',
                    style: TextStyle(
                      color: Color(0xFF8B8B8B),
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.lightBlueAccent,
                  title: const Text(
                    'Send via SMS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: Value1,
                  subtitle: const Text('+84379683482'),
                  onChanged: (bool? value) {
                    setState(() {
                      Value1 = value!;
                      Value2 = false;
                    });
                  }),
              CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.lightBlueAccent,
                  title: const Text(
                    'Send via Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: Value2,
                  subtitle: const Text('d*************a@gmail.com'),
                  onChanged: (bool? value) {
                    setState(() {
                      Value1 = false;
                      Value2 = value!;
                    });
                  }),
              const SizedBox(
                height: 380,
              ),
              ButtonTool(
                  textColor: Value1 == false && Value2 == false
                      ? Colors.black
                      : Colors.white,
                  buttonColor: Value1 == false && Value2 == false
                      ? kInactivityColor
                      : kActivityColor,
                  textbutton: 'Next',
                  onPressed: () {}),
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
