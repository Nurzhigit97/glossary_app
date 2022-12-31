import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  static String route = 'verifyScreen';
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Page'),
      ),
      body: Container(),
    );
  }
}
