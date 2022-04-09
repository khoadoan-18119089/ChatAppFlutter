import 'package:flutter/material.dart';

class Button_Tool extends StatelessWidget {
  final String textbutton;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  const Button_Tool(
      {required this.textbutton,
      required this.onPressed,
      required this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: MaterialButton(
              child: Text(
                textbutton,
                style: TextStyle(
                    fontSize: 20, color: textColor, fontFamily: 'Pacifico'),
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

class CheckBox_Tool extends StatelessWidget {
  final bool Value;
  final String title, subtitle;
  final Function(bool? value) onChange;
  const CheckBox_Tool(
      {required this.Value,
      required this.title,
      required this.subtitle,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Colors.lightBlueAccent,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: Value,
        subtitle: Text(subtitle),
        onChanged: onChange);
  }
}
