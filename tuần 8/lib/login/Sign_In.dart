import 'package:flutter/material.dart';
import 'package:messenger/login/Sign_Up/name.dart';
import 'package:messenger/performance/performance_email_pass.dart';

import '../components/Button_Tool.dart';
import '../components/Text_Tool.dart';
import '../forgot_password/forgot_pass.dart';
import '../performance/performance_Fb.dart';
import '../resources/color_manager.dart';

import 'package:messenger/constants/constants.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFieldTool(
                      errorText: PerFormance_Email_Pass.Err_text_Email,
                      controller: emailContronller,
                      icon: Icons.email,
                      label: 'Email',
                      suffixIcon: Icons.close_outlined,
                      onTapsuffixIcon: () {
                        setState(() {
                          emailContronller.text = '';
                        });
                      },
                      onChange: (Email) {
                        setState(() {
                          PerFormance_Email_Pass.validateEmail(Email);
                        });
                      },
                    ),
                    TextFieldTool(
                      errorText: PerFormance_Email_Pass.Err_text_Pass,
                      label: 'Password',
                      controller: passController,
                      icon: Icons.password,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      suffixIcon:
                          i % 2 == 1 ? Icons.visibility : Icons.visibility_off,
                      onTapsuffixIcon: () {
                        setState(() {
                          i++;
                        });
                      },
                      onChange: (pass) {
                        setState(() {
                          PerFormance_Email_Pass.length_Pass(pass);
                        });
                      },
                    ),
                  ],
                ),
              )),
          Button_Tool(
            textColor: true_falseEmail == True_False.True &&
                    passController.text.length >= 6
                ? color_manager.ktextActivityColor
                : color_manager.ktextInactivityColor,
            textbutton: 'Log In',
            buttonColor: true_falseEmail == True_False.True &&
                    passController.text.length >= 6
                ? color_manager.kbuttonActivityColor
                : color_manager.kbuttonInactivityColor,
            onPressed: () {
              PerformanceFb.sign_inAuth(emailContronller.text.toString(),
                  passController.text.toString(), context);
            },
          ),
          Button_Tool(
            textColor: color_manager.ktextActivityColor,
            textbutton: 'Create New Account',
            buttonColor: color_manager.kbuttonActivityColor,
            onPressed: () async {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Name()));
            },
          ),
          Expanded(
              child: Material(
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
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
