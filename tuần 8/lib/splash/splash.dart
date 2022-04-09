import 'package:flutter/material.dart';
import 'package:messenger/resources/assets_manager.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:messenger/login/login.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool? _isConnected;

  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(150.0),
                child: Image(
                  image: AssetImage(ImageAssets.splashLogo),
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              )),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "from",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFc3c3c3),
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
      ),
    );
  }
}
