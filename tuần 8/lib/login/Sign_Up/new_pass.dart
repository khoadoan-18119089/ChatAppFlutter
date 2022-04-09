import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger/main/main_view.dart';
import 'package:messenger/performance/performance_Fb.dart';
import 'package:messenger/performance/performance_create.dart';

import '../../components/Button_Tool.dart';
import '../../components/Text_Tool.dart';
import '../../constants/constants.dart';
import '../../performance/performance_email_pass.dart';

import 'package:messenger/resources/color_manager.dart';

class New_pass extends StatefulWidget {
  final String? Fullname, email, phone;
  final int? age;
  const New_pass({this.Fullname, this.age, this.email, this.phone, Key? key})
      : super(key: key);

  @override
  State<New_pass> createState() => _New_passState(Fullname, age, email, phone);
}

class _New_passState extends State<New_pass> {
  String? fullname, email, phone;
  final int? age;
  _New_passState(this.fullname, this.age, this.email, this.phone);
  int i = 1;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  const ListTile(
                    title: Title_Tool(title: 'Choose password'),
                    subtitle: Subtitle_Tool(
                        subtitle:
                            'Choose a password that is 6 numeric characters long. It must be a password that others cannot guess.'),
                  ),
                  TextFieldTool(
                    maxLength: 6,
                    errorText: PerFormance_Email_Pass.Err_text_Pass,
                    label: 'New password',
                    controller: passController,
                    onChange: (pass) {
                      setState(() {});
                    },
                    obscureText: i % 2 == 1 ? true : false,
                    icon: Icons.password,
                    keyboardType: TextInputType.number,
                    suffixIcon:
                        i % 2 == 1 ? Icons.visibility : Icons.visibility_off,
                    onTapsuffixIcon: () {
                      setState(() {
                        i++;
                      });
                    },
                  ),
                  const Expanded(flex: 3, child: SizedBox())
                ],
              )),
          Button_Tool(
              textbutton: 'Register',
              onPressed: () {
                auth.createUserWithEmailAndPassword(
                    email: email ?? '$phone@gmail.com',
                    password: passController.text.toString());

                Performance_create.addUser(
                    users,
                    fullname ?? 'qwe',
                    email ?? '$phone@gmail.com',
                    phone ?? '000000000000',
                    passController.text,
                    age ?? 0);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Main_view()));
              },
              buttonColor: passController.value.text.length >= 0 &&
                      passController.value.text.length < 6
                  ? color_manager.kbuttonInactivityColor
                  : color_manager.kbuttonActivityColor,
              textColor: passController.value.text.length >= 0 &&
                      passController.value.text.length < 6
                  ? color_manager.ktextInactivityColor
                  : color_manager.ktextActivityColor),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
