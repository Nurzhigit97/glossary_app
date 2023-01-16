import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/models/user_model.dart';

import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/data/repositories/user_service.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage('assets/auth/login.png'),
                    width: 300,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                    suffixIcon: Icon(Icons.alternate_email_sharp),
                    hintText: LocaleKeys.enterEmail.tr(),
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
                  errorMessage: LocaleKeys.ifErrorTextField.tr(),
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
                  child: Text(
                    LocaleKeys.login.tr(),
                  ),
                ),
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            LocaleKeys.or.tr(),
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

                    context.read<UserService>().addUser(userModel);
                    setState(() {});
                    Navigator.of(context)
                        .pushReplacementNamed(BottomNavPage.route);
                  },
                  icon: Icon(Icons.g_mobiledata_rounded),
                  label: Text(
                    LocaleKeys.signInWithGoogle.tr(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.ifHaveAccaunt.tr(),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(SignUp.route),
                      child: Text(LocaleKeys.register.tr()),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(ForgotPasswordPage.route),
                  child: Text(LocaleKeys.forgotPassword.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
