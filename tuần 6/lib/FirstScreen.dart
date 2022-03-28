import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'SecondScreen/SecondScreen.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  bool? _isConnected;

  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Mess()));
          });
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        print(err);
      }
    }
  }

  @override
  void initState() {
    _checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 6,
            child: FlatButton(
                onPressed: () {},
                splashColor: Colors.white,
                child: Image.asset(
                  'images/bkb.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ))),
        Expanded(
          child: Column(
            children: [
              const Text(
                "from",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              GradientText(
                'FACEBOOK',
                style: const TextStyle(
                  fontSize: 25,
                ),
                colors: const [
                  Color(0xFF178bff),
                  Color(0xFF9d37fe),
                  Color(0xFFff616d),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
