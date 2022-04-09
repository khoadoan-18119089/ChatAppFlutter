import 'package:flutter/material.dart';
import 'package:messenger/login/Sign_Up/required_Email.dart';

import '../../components/Button_Tool.dart';
import '../../components/Text_Tool.dart';
import '../../constants/constants.dart';
import '../../performance/performance_email_pass.dart';

import 'package:messenger/resources/color_manager.dart';

import 'new_pass.dart';

class required_Phone extends StatefulWidget {
  final String? Fullname;
  final int? age;
  const required_Phone({this.Fullname, this.age, Key? key}) : super(key: key);

  @override
  State<required_Phone> createState() =>
      _required_PhoneState(Fullname: Fullname, age: age);
}

class _required_PhoneState extends State<required_Phone> {
  final String? Fullname;
  final int? age;
  _required_PhoneState({this.Fullname, this.age});
  @override
  Widget build(BuildContext context) {
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
                    title: Title_Tool(title: 'Enter your Phone number'),
                    subtitle: Subtitle_Tool(
                        subtitle:
                            'Enter an phone number that can be used to contact you. Only you can see this information on your profile.'),
                  ),
                  TextFieldTool(
                    maxLength: 9,
                    errorText: PerFormance_Email_Pass.Err_text_Phone,
                    label: 'Phone number',
                    controller: PhoneController,
                    onChange: (phoneNumber) {
                      setState(() {
                        phone = phoneNumber;
                      });
                    },
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    suffixIcon: Icons.close_outlined,
                    prefixText: '+84 ',
                    onTapsuffixIcon: () {
                      setState(() {
                        PhoneController.text = '';
                      });
                    },
                  ),
                  const Expanded(flex: 2, child: SizedBox())
                ],
              )),
          Button_Tool(
              textColor: PhoneController.value.text.length == 9
                  ? color_manager.ktextActivityColor
                  : color_manager.ktextInactivityColor,
              buttonColor: PhoneController.value.text.length == 9
                  ? color_manager.kbuttonActivityColor
                  : color_manager.kbuttonInactivityColor,
              textbutton: 'Next',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => New_pass(
                              Fullname: Fullname,
                              age: age,
                              phone: phone,
                            )));
              }),
          Expanded(
              child: Material(
            child: GestureDetector(
              child: const Center(
                  child: Text(
                'Register by Email',
                style: TextStyle(
                    color: Color(0xFF0071C5),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              )),
              onTap: () {
                print(Fullname);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Required_Email(
                              Fullname: Fullname,
                              age: age,
                            )));
              },
            ),
          )),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
