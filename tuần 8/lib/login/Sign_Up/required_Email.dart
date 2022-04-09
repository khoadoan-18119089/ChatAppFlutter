import 'package:flutter/material.dart';
import 'package:messenger/login/Sign_Up/new_pass.dart';
import 'package:messenger/login/Sign_Up/required_Phone.dart';
import 'package:messenger/performance/performance_email_pass.dart';

import 'package:messenger/constants/constants.dart';
import 'package:messenger/resources/color_manager.dart';

import '../../components/Button_Tool.dart';
import '../../components/Text_Tool.dart';



class Required_Email extends StatefulWidget {
  final String? Fullname;
  final int? age;
  const Required_Email({this.Fullname, this.age, Key? key}) : super(key: key);

  @override
  State<Required_Email> createState() =>
      _Required_EmailState(Fullname: Fullname, age: age);
}

class _Required_EmailState extends State<Required_Email> {
  final String? Fullname;
  final int? age;
  _Required_EmailState({this.Fullname, this.age});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        const SizedBox(
          height: 25,
        ),
        Expanded(
            flex: 7,
            child: Column(
              children: [
                const ListTile(
                  title: Title_Tool(title: 'Enter your email address'),
                  subtitle: Subtitle_Tool(
                      subtitle:
                          'Enter an email that can be used to contact you. Only you can see this information on your profile.'),
                ),
                TextFieldTool(
                  errorText: PerFormance_Email_Pass.Err_text_Email,
                  label: 'Email',
                  controller: emailContronller,
                  onChange: (Email) {
                    setState(() {
                      PerFormance_Email_Pass.validateEmail(Email);
                    });
                  },
                  icon: Icons.email,
                  suffixIcon: Icons.close_outlined,
                  onTapsuffixIcon: () {
                    setState(() {
                      emailContronller.text = '';
                    });
                  },
                ),
                const Expanded(flex: 2, child: SizedBox())
              ],
            )),
        Button_Tool(
            textColor: true_falseEmail == True_False.Null ||
                    true_falseEmail == True_False.False
                ? color_manager.ktextInactivityColor
                : color_manager.ktextActivityColor,
            buttonColor: true_falseEmail == True_False.Null ||
                    true_falseEmail == True_False.False
                ? color_manager.kbuttonInactivityColor
                : color_manager.kbuttonActivityColor,
            textbutton: 'Next',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => New_pass(
                            Fullname: Fullname,
                            age: age,
                            email: emailContronller.text,
                          )));
            }),
        Expanded(
            child: Material(
          child: GestureDetector(
            child: const Center(
                child: Text(
              'Register by phone number',
              style: TextStyle(
                  color: Color(0xFF0071C5),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => required_Phone(
                            Fullname: Fullname,
                            age: age,
                          )));
            },
          ),
        )),
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
