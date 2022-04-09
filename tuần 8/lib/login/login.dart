import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/resources/assets_manager.dart';

import 'Sign_In.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Sign_in_up sign_in_up = Sign_in_up.sign_in;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(80.0),
                child: Image(
                  image: AssetImage(ImageAssets.loginLogo),
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              )),
          Sign_in()
        ],
      ),
    );
  }
}
