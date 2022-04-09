import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/login/Sign_Up/birthday.dart';
import 'package:messenger/resources/color_manager.dart';

import '../../components/Button_Tool.dart';
import '../../components/Text_Tool.dart';


class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  const ListTile(
                    title: Title_Tool(title: 'What your name?'),
                    subtitle:
                        Subtitle_Tool(subtitle: 'Enter your name in real life'),
                  ),
                  Expanded(
                    child: Material(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: SizedBox(
                            child: TextField(
                              onChanged: (lastName) {
                                setState(() {});
                              },
                              controller: Last_NameContronller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name'),
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: SizedBox(
                            child: TextField(
                              controller: First_NameController,
                              onChanged: (firstName) {
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name'),
                            ),
                          )),
                    ),
                  ),
                  const Expanded(flex: 5, child: SizedBox())
                ],
              ),
            ),
            Button_Tool(
                textbutton: 'Next',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Birthday(
                              Fullname: First_NameController.text.toString() +
                                  Last_NameContronller.text.toString())));
                },
                buttonColor: Last_NameContronller.text.isNotEmpty &&
                        First_NameController.text.isNotEmpty
                    ? color_manager.kbuttonActivityColor
                    : color_manager.kbuttonInactivityColor,
                textColor: Last_NameContronller.text.isNotEmpty &&
                        First_NameController.text.isNotEmpty
                    ? color_manager.ktextActivityColor
                    : color_manager.ktextInactivityColor),
            const SizedBox(
              height: 30,
            )
          ],
        ));
  }
}
