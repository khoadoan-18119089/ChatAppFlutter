import 'package:flutter/material.dart';
import 'package:messenger/performance/performance_create.dart';

import '../constants/constants.dart';

class Main_view extends StatefulWidget {
  const Main_view({Key? key}) : super(key: key);

  @override
  State<Main_view> createState() => _Main_viewState();
}

class _Main_viewState extends State<Main_view> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              onPressed: () {
                setState(() {
                });
              },
              child: Text('data'))
        ],
      ),
    );
  }
}
