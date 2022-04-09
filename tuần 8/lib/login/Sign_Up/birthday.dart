import 'package:flutter/material.dart';
import 'package:messenger/login/Sign_Up/required_Email.dart';
import 'package:messenger/resources/color_manager.dart';

import '../../components/Button_Tool.dart';
import '../../components/Text_Tool.dart';


class Birthday extends StatefulWidget {
  final String? Fullname;
  const Birthday({this.Fullname, Key? key}) : super(key: key);

  @override
  State<Birthday> createState() => _BirthdayState(Fullname: Fullname);
}

class _BirthdayState extends State<Birthday> {
  final String? Fullname;
  DateTime dateTime = DateTime.now();
  int age = 0;
  _BirthdayState({this.Fullname});

  Future<void> SelecDay(BuildContext context) async {
    DateTime? TimePicker = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );

    if (TimePicker != dateTime && TimePicker != null) {
      setState(() {
        dateTime = TimePicker;
        age = 2020 - dateTime.year;
        print(2020 - dateTime.year);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  const ListTile(
                    title: Title_Tool(title: 'When is your birthday?'),
                    subtitle: Subtitle_Tool(
                        subtitle:
                            'Choose your date of birth. You can always make this information private another time.'),
                  ),
                  Expanded(
                    child: Material(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: SizedBox(
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  SelecDay(context);
                                });
                              },
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Birthday',
                                  hintText: dateTime.year.toString() +
                                      '-' +
                                      dateTime.month.toString() +
                                      '-' +
                                      dateTime.day.toString()),
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    'Age: $age',
                    style: const TextStyle(
                      color: Color(0xFF8B8B8B),
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  )),
                  const Expanded(flex: 4, child: SizedBox())
                ],
              )),
          Button_Tool(
              textbutton: 'Next',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Required_Email(
                              Fullname: Fullname,
                              age: age,
                            )));
              },
              buttonColor: age > 0
                  ? color_manager.kbuttonActivityColor
                  : color_manager.kbuttonInactivityColor,
              textColor: age > 0
                  ? color_manager.ktextActivityColor
                  : color_manager.ktextInactivityColor),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
