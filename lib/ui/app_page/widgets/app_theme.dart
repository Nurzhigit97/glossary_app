import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 22, 82, 131),
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
      );
}
