import 'package:flutter/material.dart';
import 'buttonMain.dart';
import 'TextFieldMain.dart';

class Mess extends StatefulWidget {
  const Mess({Key? key}) : super(key: key);

  @override
  State<Mess> createState() => _MessState();
}

class _MessState extends State<Mess> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: FlatButton(
              splashColor: Colors.white,
              onPressed: () {},
              color: Colors.white,
              child: Image.asset(
                'images/bkb.png',
                width: 90,
                height: 90,
                fit: BoxFit.fill,
              ),
            )),
        const TextFieldMain(text: 'Phone number or email'),
        const TextFieldMain(
          text: 'Password',
        ),
        const button(
          textbutton: 'LOG IN',
        ),
        const button(textbutton: 'CREATE NEW ACCOUNT'),
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
            onTap: () {},
          ),
        ))
      ],
    );
  }
}
