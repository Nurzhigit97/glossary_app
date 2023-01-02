import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  handleAuthState() {
    return StreamBuilder(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return HomeScreen();
            // Если нужно сделаем вход через email
            // return SignIn();
          }
        });
  }

  login(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pushReplacementNamed(
        HomeScreen.route,
      );
    } on firebase_auth.FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
        ),
      );
    }
  }

  Future register(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    firebase_auth.FirebaseAuth firebaseAuth =
        firebase_auth.FirebaseAuth.instance;

    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.of(context).pushReplacementNamed(
        SignIn.route,
      );
    } on firebase_auth.FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
        ),
      );
    }
  }

  signInWithGoole() async {
    // Trigger the authentification flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential
    final credential = await firebase_auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //! once signed in, return the UserCredential
    return await firebaseAuth.signInWithCredential(credential);
  }

  resetPassword(
      {required BuildContext context,
      required TextEditingController emailController}) async {
    showDialog(
      context: context,
      builder: ((context) => Center(
            child: CircularProgressIndicator(),
          )),
    );
    try {
      await firebaseAuth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Запрос на сброс пароля был отправлен'),
        ),
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on firebase_auth.FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  signOut() {
    firebaseAuth.signOut();
  }
}
