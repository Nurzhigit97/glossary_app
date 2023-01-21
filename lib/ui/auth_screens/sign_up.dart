import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/sign_in.dart';
import 'package:glossary_app/ui/auth_screens/widgets/auth_methods.dart';

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
    _nameController.dispose();
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
                      image: AssetImage('assets/auth/register.png'),
                      width: 300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthMethods.buildName(
                      nameController: _nameController,
                      enterName: LocaleKeys.enterName.tr(),
                      nameIsValid: LocaleKeys.nameIsValid.tr()),
                  SizedBox(
                    height: 10,
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
                  AuthMethods.register(
                    context: context,
                    emailController: _emailController,
                    formKey: formKey,
                    nameController: _nameController,
                    passwordController: _passwordController,
                    register: LocaleKeys.register.tr(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AuthMethods.goToSignInOrRegisterPage(
                    context: context,
                    hanveAccauntOrNot: LocaleKeys.ifHaveAccaunt.tr(),
                    routeName: SignIn.route,
                    loginOrRegister: LocaleKeys.login.tr(),
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
