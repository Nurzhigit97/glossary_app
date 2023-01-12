import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 22, 82, 131),
        titleTextStyle: TextStyle(fontSize: 20),
      ),
    );
  }
}
