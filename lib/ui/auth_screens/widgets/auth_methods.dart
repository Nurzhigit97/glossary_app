import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/models/user_model.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/data/repositories/user_service.dart';

class AuthMethods {
  static ElevatedButton register({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String register,
  }) {
    return ElevatedButton(
      onPressed: () async {
        final isValid = formKey.currentState!.validate();
        // если введенные email и password верны даем доступ к регистрации
        if (isValid) {
          // /// cоздаем пользователя в Firebase Auth
          final uid = await context.read<FirebaseService>().register(
                context: context,
                emailController: emailController,
                passwordController: passwordController,
              );

          if (uid == null) return;

          /// cоздаем документ пользователя в Firebase Firestore
          final userModel = UserModel(
            id: uid,
            name: nameController.text,
            email: emailController.text,
            role: UserRole.user,
          );

          /// cоздаем пользователя в Firebase Firestore
          await context.read<UserService>().addUser(userModel);
        }
      },
      child: Text(register),
    );
  }

  static ElevatedButton login({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String login,
  }) {
    return ElevatedButton(
      onPressed: () async {
        final isVaidForm = formKey.currentState!.validate();
        if (isVaidForm) {
          await context.read<FirebaseService>().login(
              context: context,
              emailController: emailController,
              passwordController: passwordController);
        }
      },
      child: Text(
        login,
      ),
    );
  }

  static TextFormField buildName({
    required TextEditingController nameController,
    required String enterName,
    required String nameIsValid,
  }) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, left: 10),
        prefixIcon: Icon(Icons.person),
        hintText: enterName,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle: TextStyle(
          fontSize: 14,
          color: Colors.red,
        ),
      ),
      validator: (name) {
        if (name != null && name.length > 20) {
          return nameIsValid;
        } else {
          return null;
        }
      },
    );
  }

  static Row goToSignInOrRegisterPage(
      {required BuildContext context,
      required String hanveAccauntOrNot,
      required String routeName,
      required String loginOrRegister}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hanveAccauntOrNot.toString(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(routeName),
          child: Text(
            loginOrRegister.toString(),
          ),
        ),
      ],
    );
  }

  static TextFormField buildEmail({
    required TextEditingController emailController,
    required String enterEmail,
    required String emailIsValid,
  }
// LocaleKeys.enterEmail.tr(),
      ) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, left: 10),
        prefixIcon: Icon(Icons.email_outlined),
        hintText: enterEmail,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? emailIsValid
          : null,
    );
  }

  static TextFormField buildPassword({
    required TextEditingController passwordController,
    required String enterPassword,
    required String passwordIsValid,
  }) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, left: 10),
        prefixIcon: Icon(Icons.lock),
        hintText: enterPassword,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value != null && value.length < 7) {
          return passwordIsValid;
        } else {
          return null;
        }
      },
    );
  }

  static ElevatedButton signInWithGoogle(
      {required BuildContext context,
      required String bottomNavPageRoute,
      required String signInWithGoogle}) {
    return ElevatedButton.icon(
      onPressed: () async {
        final authGoogle =
            await context.read<FirebaseService>().signInWithGoole();

        /// cоздаем документ пользователя в Firebase Firestore
        final userModel = UserModel(
          id: authGoogle.user?.uid,
          name: authGoogle.user?.displayName,
          email: authGoogle.user!.email,
          role: UserRole.user,
        );

        /// add user to user db
        await context.read<UserService>().addUser(userModel);
        Navigator.of(context).pushReplacementNamed(bottomNavPageRoute);
      },
      icon: Icon(Icons.g_mobiledata_rounded),
      label: Text(
        signInWithGoogle,
      ),
    );
  }

  static TextButton forgotPassword(
      {required BuildContext context,
      required String forgotRoute,
      required String forgotText}) {
    return TextButton(
      onPressed: () => Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(forgotRoute),
      child: Text(forgotText),
    );
  }
}
