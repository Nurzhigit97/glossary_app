import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  Widget handleAuthState() {
    return StreamBuilder<firebase_auth.User?>(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          return HomeScreen();
          /* if (snapshot.hasData) {
            return HomeScreen();
            /*  /// получаем id пользователя
            final userUid = snapshot.data!.uid;

            /// получаем данные пользователя из firestore по id
            return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance.doc('users/$userUid').get(),
              builder: (context, snapshot) {
                /// проверяем произошла ли ошибка при получении
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                /// проверяем получили ли данные
                if (snapshot.hasData) {
                  /// получаем тип роли пользователя
                  if (snapshot.data!.data() == null) {
                    return HomeScreen();
                  }
                  final firestoreDocJson = snapshot.data!.data()!;
                  final userModel = UserModel.fromJson(firestoreDocJson);
                  final role = userModel.role;

                  /// это админ ?
                  if (role == UserRole.admin) {
                    return AdminPanel();
                  }

                  /// иначе это пользователь
                  return HomeScreen();
                }

                /// иначе загрузка
                return Center(child: CircularProgressIndicator());
              },
            ); */
          }
           else {
            return SignIn();
          } */
        });
  }

  Future<void> login({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
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

  /// метод вернет uid только что зарегистрированного пользователя
  Future<String?> register({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    firebase_auth.FirebaseAuth firebaseAuth =
        firebase_auth.FirebaseAuth.instance;

    try {
      final userData = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.of(context).pushReplacementNamed(
        SignIn.route,
      );

      /// если регистрация прошла успешно - возвращаем uid
      return userData.user?.uid;
    } on firebase_auth.FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
        ),
      );

      /// если произошла ошибка - возвращаем null
      return null;
    }
  }

  Future<UserCredential> signInWithGoole() async {
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

  Future<void> resetPassword({
    required BuildContext context,
    required TextEditingController emailController,
  }) async {
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

  Future<void> signOut() async {
    firebaseAuth.signOut();
  }

  Future deleteUser(context) async {
    if (firebaseAuth.currentUser == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Вы вышли из аккаунта или не прошли авторизацию'),
        ),
      );
    }

    await firebaseAuth.currentUser?.delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ваш аккаунт успешно удален'),
      ),
    );
  }
}
