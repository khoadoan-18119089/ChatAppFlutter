import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/performance/performance_create.dart';
import 'package:messenger/performance/performance_email_pass.dart';

import '../components/Button_Tool.dart';
import '../components/Text_Tool.dart';
import '../main/main_view.dart';
import '../resources/color_manager.dart';

class Update extends StatefulWidget {
  final String? email;
  const Update({this.email, Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState(email: email);
}

class _UpdateState extends State<Update> {
  String? email;
  _UpdateState({this.email});
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
                    errorText: PerFormance_Email_Pass.Err_text_Pass,
                    label: 'Password',
                    controller: passController,
                    onChange: (pass) {
                      setState(() {
                        PerFormance_Email_Pass.length_Pass(pass);
                      });
                    },
                  ),
                ],
              )),
          Button_Tool(
              textColor: passController.text.length >= 6
                  ? color_manager.ktextActivityColor
                  : color_manager.ktextInactivityColor,
              buttonColor: passController.text.length >= 6
                  ? color_manager.kbuttonActivityColor
                  : color_manager.kbuttonInactivityColor,
              textbutton: 'Next',
              onPressed: () {
                
                Performance_create.UpUsers(users, email ?? 'err@gmail.com',
                    passController.text.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Main_view()));
              }),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
