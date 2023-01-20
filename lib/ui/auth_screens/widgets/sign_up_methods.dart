import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpMethods {
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
}
