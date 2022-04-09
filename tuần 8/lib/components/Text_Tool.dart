import 'package:flutter/material.dart';

class TextFieldTool extends StatelessWidget {
  final String? label, errorText,prefixText;
  final int? maxLength;
  final bool obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  final Function(String a)? onChange;
  final Function()? onTap;
  final Function()? onTapsuffixIcon;
  final TextEditingController? controller;
  const TextFieldTool(
      {required this.label,
      this.controller,
      this.onChange,
      this.onTap,
      this.errorText,
      this.icon,
      this.suffixIcon,
      this.onTapsuffixIcon,
      this.obscureText = false,
      this.prefixText,
      this.keyboardType,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: SizedBox(
              child: TextField(
                keyboardType: keyboardType,
                obscureText: obscureText,
                onTap: onTap,
                onChanged: onChange,
                controller: controller,
                maxLength: maxLength,
                decoration: InputDecoration(
                  icon: Icon(icon),
                  filled: true,
                  prefixText: prefixText,
                  suffixIcon: GestureDetector(
                    child: Icon(suffixIcon),
                    onTap: onTapsuffixIcon,
                  ),
                  errorText: errorText,
                  border: const UnderlineInputBorder(),
                  labelText: label,
                ),
              ),
            )),
      ),
    );
  }
}

class Title_Tool extends StatelessWidget {
  final String title;

  const Title_Tool({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title,
          style: const TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40,
              fontWeight: FontWeight.bold)),
    );
  }
}

class Subtitle_Tool extends StatelessWidget {
  final String subtitle;
  const Subtitle_Tool({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        subtitle,
        style: const TextStyle(
          color: Color(0xFF8B8B8B),
          fontFamily: 'Pacifico',
          fontSize: 20,
        ),
      ),
    );
  }
}
