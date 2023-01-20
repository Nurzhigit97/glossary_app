import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/widgets/forgot_password_page.dart';
import 'package:glossary_app/ui/auth_screens/sign_up.dart';
import 'package:glossary_app/ui/auth_screens/widgets/sign_up_methods.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_page.dart';

class SignIn extends StatefulWidget {
  static String route = 'signIn';
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/auth/login.png'),
                      width: 300,
                    ),
                  ),
                  AuthMethods.buildEmail(
                    emailController: _emailController,
                    emailIsValid: LocaleKeys.emailIsValid.tr(),
                    enterEmail: LocaleKeys.enterEmail.tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthMethods.buildPassword(
                    passwordController: _passwordController,
                    enterPassword: LocaleKeys.enterPassword.tr(),
                    passwordIsValid: LocaleKeys.passwordIsValid.tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthMethods.login(
                      context: context,
                      emailController: _emailController,
                      formKey: formKey,
                      login: LocaleKeys.login.tr(),
                      passwordController: _passwordController),
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
                  AuthMethods.signInWithGoogle(
                      context: context,
                      bottomNavPageRoute: BottomNavPage.route,
                      signInWithGoogle: LocaleKeys.signInWithGoogle.tr()),
                  AuthMethods.goToSignInOrRegisterPage(
                    context: context,
                    hanveAccauntOrNot: LocaleKeys.dontHaveAccount.tr(),
                    routeName: SignUp.route,
                    loginOrRegister: LocaleKeys.register.tr(),
                  ),
                  AuthMethods.forgotPassword(
                      context: context,
                      forgotRoute: ForgotPasswordPage.route,
                      forgotText: LocaleKeys.forgotPassword.tr()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
