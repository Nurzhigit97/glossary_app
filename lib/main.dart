import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/appPage/app.dart';
import 'package:glossary_app/resources/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// В последнем странице IntroPage() переключает на true
  final prefs = await SharedPreferences.getInstance();
  final showHome = await prefs.getBool('showHome') ?? false;
  runApp(
    App(showHome),
  );
}
