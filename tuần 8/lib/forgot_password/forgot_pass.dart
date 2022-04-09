import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger/forgot_password/verify_account.dart';

import 'package:messenger/constants/constants.dart';
import 'package:messenger/performance/performance_email_pass.dart';

import '../components/Button_Tool.dart';
import '../components/Text_Tool.dart';
import '../performance/performance_create.dart';
import '../resources/color_manager.dart';

class Forgot_Pass extends StatefulWidget {
  const Forgot_Pass({Key? key}) : super(key: key);

  @override
  State<Forgot_Pass> createState() => _Forgot_PassState();
}

class _Forgot_PassState extends State<Forgot_Pass> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
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
                    title: Title_Tool(title: 'Forgot Password'),
                    subtitle: Subtitle_Tool(subtitle: 'Enter your email'),
                  ),
                  TextFieldTool(
                    label: 'Email',
                    errorText: PerFormance_Email_Pass.Err_text_Email,
                    controller: emailContronller,
                    icon: Icons.email,
                    suffixIcon: Icons.disabled_by_default_outlined,
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
                ],
              )),
          Button_Tool(
              textColor: true_falseEmail == True_False.False
                  ? color_manager.ktextInactivityColor
                  : color_manager.ktextActivityColor,
              buttonColor: true_falseEmail == True_False.False
                  ? color_manager.kbuttonInactivityColor
                  : color_manager.kbuttonActivityColor,
              textbutton: 'Next',
              onPressed: () async {
                Performance_create.checkIfLikedOrNot(
                    users, context, emailContronller.text.toString());
                if (ds_bool == true) {
                  print('ds');
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
