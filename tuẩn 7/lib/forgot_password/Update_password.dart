import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';

import '../tool/Button.dart';
import '../tool/TextField.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
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
          TextFieldTool(text: 'Password', controller: passController),
          Expanded(
            flex: 4,
            child: Container(color: Colors.white),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  ButtonTool(
                      textColor: passController.text.length == 6
                          ? Colors.white
                          : Colors.black,
                      buttonColor: kbuttonActivityColor,
                      textbutton: 'Next',
                      onPressed: () {}),
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
