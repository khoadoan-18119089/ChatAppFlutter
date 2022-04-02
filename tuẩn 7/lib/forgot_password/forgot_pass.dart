import 'package:flutter/material.dart';
import 'package:messenger/forgot_password/verify_account.dart';
import 'package:messenger/tool/Button.dart';
import 'package:messenger/tool/TextField.dart';
import 'package:messenger/constants/constants.dart';

class Forgot_Pass extends StatefulWidget {
  const Forgot_Pass({Key? key}) : super(key: key);

  @override
  State<Forgot_Pass> createState() => _Forgot_PassState();
}

class _Forgot_PassState extends State<Forgot_Pass> {
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
                    'Forgot Password',
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
                    'Enter your email',
                    style: TextStyle(
                      color: Color(0xFF8B8B8B),
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          )),
          TextFieldTool(text: 'Email', controller: emailContronller),
          Expanded(
            flex: 4,
            child: Container(color: Colors.white),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  ButtonTool(
                    textColor: Colors.black,
                    buttonColor: kbuttonActivityColor,
                    textbutton: 'Next', 
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Verify()));
                    }),
                  Container(
                    height: 30,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
