import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/data/repositories/user_service.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/sign_in.dart';
import 'package:passwordfield/passwordfield.dart';

import '../../data/models/user_model.dart';

class SignUp extends StatefulWidget {
  static String route = 'signUp';

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/auth/register.png'),
                      width: 300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      suffixIcon: Icon(Icons.person),
                      hintText: LocaleKeys.enterName.tr(),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      suffixIcon: Icon(Icons.alternate_email_sharp),
                      hintText: LocaleKeys.errorTextFieldEmail.tr(),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Введите правильный эл. почту'
                            : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PasswordField(
                      controller: _passwordController,
                      color: Colors.blue,
                      passwordConstraint: r'.*[0-9].*',
                      inputDecoration: PasswordDecoration(
                        hintStyle: TextStyle(color: null),
                        inputPadding: EdgeInsets.only(top: 5, left: 10),
                      ),
                      hintText: LocaleKeys.enterPassword.tr(),
                      border: PasswordBorder(
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
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 2, color: Colors.red.shade200),
                        ),
                      ),
                      errorMessage: LocaleKeys.ifErrorTextField.tr()),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final isValid = formKey.currentState!.validate();
                      // если введенные email и password не верны не даем доступ к регистрации
                      if (!isValid) return;

                      /// cоздаем пользователя в Firebase Auth
                      final uid =
                          await context.read<FirebaseService>().register(
                                context: context,
                                emailController: _emailController,
                                passwordController: _passwordController,
                              );

                      if (uid == null) return;

                      /// cоздаем документ пользователя в Firebase Firestore
                      final userModel = UserModel(
                        id: uid,
                        name: _nameController.text,
                        email: _emailController.text,
                        role: UserRole.user,
                      );

                      context.read<UserService>().addUser(userModel);
                      setState(() {});
                    },
                    child: Text(
                      LocaleKeys.register.tr(),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.ifHaveAccaunt.tr(),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(SignIn.route),
                        child: Text(
                          LocaleKeys.login.tr(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
