import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/models/user_model.dart';

import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/data/repositories/user_service.dart';
import 'package:glossary_app/ui/auth_screens/forgot_password_page.dart';
import 'package:glossary_app/ui/auth_screens/sign_up.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_page.dart';
import 'package:passwordfield/passwordfield.dart';

class SignIn extends StatefulWidget {
  static String route = 'signIn';
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage('assets/auth/signIn.webp'),
                    width: 200,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black26),
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                    suffixIcon: Icon(Icons.alternate_email_sharp),
                    hintText: 'Введите почту...',
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
                ),
                SizedBox(
                  height: 10,
                ),
                PasswordField(
                  controller: _passwordController,
                  color: Colors.blue,
                  passwordConstraint: r'.*[@$#.*].*',
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
                  errorMessage:
                      'Должен содержать специальный символ . * @ # \$',
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await context.read<FirebaseService>().login(
                        context: context,
                        emailController: _emailController,
                        passwordController: _passwordController);
                  },
                  child: const Text('Войти'),
                ),
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        color: Color.fromARGB(255, 21, 72, 212),
                        indent: 50,
                        endIndent: 50,
                        thickness: 1.5,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Или',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
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

                    UserService().addUser(userModel);
                    setState(() {});
                    Navigator.of(context)
                        .pushReplacementNamed(BottomNavPage.route);
                  },
                  icon: Icon(Icons.g_mobiledata_rounded),
                  label: Text('Авторизация с  Google'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("У вас еще нет учетной записи?"),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(SignUp.route),
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(ForgotPasswordPage.route),
                  child: Text('Забыли пароль?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}