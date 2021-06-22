import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('TimePay'),
          centerTitle: true,
          elevation: 2,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          _customRaisedButton('Sign in with Google', Colors.amber),
          _customRaisedButton('Sign in with Facebook', Colors.greenAccent),
        ],
      ),
    );
  }

  Widget _customRaisedButton(buttonText, buttonColor) {
    return TextButton(
      onPressed: () {},
      child: Text(
        buttonText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed))
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10));
          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
        }),
        elevation:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) return 20;
          return 5;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return Colors.orange;
            return buttonColor; // Use the component's default.
          },
        ),
      ),
    );
  }
}
