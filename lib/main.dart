import 'package:flutter/material.dart';
import 'package:glossary_app/app.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(
    showHome ? App() : IntroApp(),
  );
}
