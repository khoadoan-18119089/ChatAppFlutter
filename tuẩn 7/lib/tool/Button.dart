import 'package:flutter/material.dart';

class ButtonTool extends StatelessWidget {
  final String textbutton;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  ButtonTool(
      {required this.textbutton,
      required this.onPressed,
      required this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: MaterialButton(
              child: Text(
                textbutton,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontFamily: 'Pacifico'),
              ),
              onPressed: onPressed,
              color: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ));
  }
}
