import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        'Глоссарий по Информатике на кыргызском языке',
        style: TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 75, 73, 73),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
