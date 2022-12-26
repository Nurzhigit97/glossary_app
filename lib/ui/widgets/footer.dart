import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Color.fromARGB(255, 27, 46, 78),
      child: Center(
        child: Text(
          '@ ${DateTime.now().year} Глоссарий',
          style: TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }
}
