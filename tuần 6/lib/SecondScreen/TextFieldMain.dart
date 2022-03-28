import 'package:flutter/material.dart';

class TextFieldMain extends StatelessWidget {
  final String text;
  const TextFieldMain({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Container(
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: text,
                ),
              ),
            )),
      ),
    );
  }
}
