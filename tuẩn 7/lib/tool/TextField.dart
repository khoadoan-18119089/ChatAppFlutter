import 'package:flutter/material.dart';

class TextFieldTool extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const TextFieldTool({required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Material(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Container(
              color: Colors.white,
              child: TextField(
                controller: controller,
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
