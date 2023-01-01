import 'package:flutter/material.dart';

import 'package:glossary_app/ui/authScreens/forgot_password_page.dart';
import 'package:glossary_app/ui/authScreens/registered_dialog.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:glossary_app/ui/authScreens/sign_up.dart';
import 'package:glossary_app/ui/authScreens/verify_email_screen.dart';
import 'package:glossary_app/ui/drawerScreens/history_page.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      HomeScreen.route: (_) => HomeScreen(),
      IntroScreen.route: (_) => IntroScreen(),
      HistoryPage.route: (_) => HistoryPage(),
      SignIn.route: (_) => SignIn(),
      SignUp.route: (_) => SignUp(),
      RegisteredDialog.route: (_) => RegisteredDialog(),
      ForgotPasswordPage.route: (_) => ForgotPasswordPage(),
      VerifyEmailScreen.route: (_) => VerifyEmailScreen(),
    };