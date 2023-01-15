import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/resources/firebase_options.dart';
import 'package:glossary_app/ui/app_page/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // В последнем странице IntroPage() переключает на true
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ky'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: App(showHome),
    ),
  );
}
