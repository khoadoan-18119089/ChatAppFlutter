import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String textbutton;
  const button({required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: MaterialButton(
          child: Text(textbutton),
          onPressed: () {},
          color: const Color(0xFFF5F5F5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ));
  }
}
