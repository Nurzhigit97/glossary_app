import 'package:flutter/material.dart';
import 'package:glossary_app/app.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//! firebase
  await Firebase.initializeApp();
  //! isLogined
  final prefs = await SharedPreferences.getInstance();
  final showHome = await prefs.getBool('showHome') ?? false;
  runApp(
    showHome ? App() : IntroScreen(),
  );
}
