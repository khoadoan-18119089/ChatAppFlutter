import 'package:flutter/material.dart';
import 'package:messenger/performance/performance_Fb.dart';
import 'package:messenger/tool/Button.dart';
import 'package:messenger/tool/TextField.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/forgot_password/forgot_pass.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Sign_in_up sign_in_up = Sign_in_up.sign_in;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: FlatButton(
                splashColor: Colors.white,
                onPressed: () {},
                color: Colors.white,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    'images/bkb.png',
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  focusColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      sign_in_up = Sign_in_up.sign_in;
                    });
                  },
                  color: sign_in_up == Sign_in_up.sign_in
                      ? kActivityColor
                      : kInactivityColor,
                  child: const Text('Sign_in'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(
                  width: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      sign_in_up = Sign_in_up.sign_up;
                    });
                  },
                  color: sign_in_up == Sign_in_up.sign_up
                      ? kActivityColor
                      : kInactivityColor,
                  child: const Text('Sign_up'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                )
              ],
            ),
          )),
          Container(
            height: 15,
            color: Colors.white,
          ),
          sign_in_up == Sign_in_up.sign_in ? const Sign_in() : const Sign_up(),
        ],
      ),
    );
  }
}

class Sign_in extends StatelessWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldTool(
            text: 'Email',
            controller: emailContronller,
          ),
          TextFieldTool(
            text: 'Password',
            controller: passController,
          ),
          Container(
            height: 50,
            color: Colors.white,
          ),
          ButtonTool(
            textColor: Colors.black,
            textbutton: 'Log In',
            buttonColor: kbuttonActivityColor,
            onPressed: () {
              PerformanceFb.sign_inAuth(emailContronller.text.toString(),
                  passController.text.toString());
            },
          ),
          Expanded(
              child: Material(
            color: Colors.white,
            child: GestureDetector(
              child: const Center(
                  child: Text(
                'FORGOT PASSWORD',
                style: TextStyle(
                    color: Color(0xFF0071C5), fontWeight: FontWeight.bold),
              )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Forgot_Pass()));
              },
            ),
          )),
          Container(
            height: 55,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Sign_up extends StatelessWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldTool(
            text: 'Email',
            controller: emailContronller,
          ),
          TextFieldTool(
            text: 'Password',
            controller: passController,
          ),
          Container(
            height: 50,
            color: Colors.white,
          ),
          ButtonTool(
            textColor: Colors.black,
            textbutton: 'Create New Account',
            buttonColor: kbuttonActivityColor,
            onPressed: () async {
              PerformanceFb.createAuth(emailContronller.text.toString(),
                  passController.text.toString());
            },
          ),
          Expanded(
              child: Container(
            color: Colors.white,
          )),
          Container(
            height: 55,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
