import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/data/repositories/user_service.dart';
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/auth/signUp.webp'),
                      width: 250,
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
                      hintText: 'Введите имя...',
                      hintStyle: TextStyle(color: Colors.black26),
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
                      hintText: 'Введите почту...',
                      hintStyle: TextStyle(color: Colors.black26),
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
                      hintStyle: TextStyle(color: Colors.black26),
                      inputPadding: EdgeInsets.only(top: 5, left: 10),
                    ),
                    hintText: 'Введите пароль...',
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
                    errorMessage: 'Должен содержать хотябы одну цифру',
                  ),
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

                      UserService().addUser(userModel);
                      setState(() {});
                    },
                    child: Text('Регистрация'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Уже есть учетная запись?'),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(SignIn.route),
                        child: Text('Sign In'),
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