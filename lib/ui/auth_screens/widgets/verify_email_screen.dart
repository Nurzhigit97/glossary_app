import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/sign_in.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_page.dart';

class VerifyEmailScreen extends StatefulWidget {
  static String route = 'verifyScreen';
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResentEmail = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => chechEmailVerified(),
      );
    }
  }

  Future chechEmailVerified() async {
    // call after email verification!
    if (await FirebaseAuth.instance.currentUser == null) {
      Navigator.of(context).pushReplacementNamed(SignIn.route);
    } else {
      await FirebaseAuth.instance.currentUser!.reload();
    }

    setState(() {
      if (FirebaseAuth.instance.currentUser?.emailVerified == false ||
          FirebaseAuth.instance.currentUser?.emailVerified == null) {
        isEmailVerified = false;
      } else {
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      }
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResentEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResentEmail = true);
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? BottomNavPage()
        : Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.verifyPage.tr()),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.sendVerifyToEmail.tr(),
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: canResentEmail ? sendVerificationEmail : null,
                    icon: Icon(Icons.email),
                    label: Text(LocaleKeys.repeatSendVerify.tr()),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await context.read<FirebaseService>().signOut();

                        Navigator.of(context).pushNamed(SignIn.route);
                      } on FirebaseAuthException catch (err) {
                        print(err);
                      }
                    },
                    child: Text(LocaleKeys.signOut.tr()),
                  ),
                ],
              ),
            ),
          );
  }
}
