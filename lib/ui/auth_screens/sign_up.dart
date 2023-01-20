import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/data/repositories/user_service.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/sign_in.dart';
import 'package:glossary_app/ui/auth_screens/widgets/sign_up_methods.dart';

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
                  SignUpMethods.buildName(
                      nameController: _nameController,
                      enterName: LocaleKeys.enterName.tr(),
                      nameIsValid: LocaleKeys.nameIsValid.tr()),
                  SizedBox(
                    height: 10,
                  ),
                  SignUpMethods.buildEmail(
                    emailController: _emailController,
                    emailIsValid: LocaleKeys.emailIsValid.tr(),
                    enterEmail: LocaleKeys.enterEmail.tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SignUpMethods.buildPassword(
                    passwordController: _passwordController,
                    enterPassword: LocaleKeys.enterPassword.tr(),
                    passwordIsValid: LocaleKeys.passwordIsValid.tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final isValid = formKey.currentState!.validate();
                      // если введенные email и password верны даем доступ к регистрации
                      if (isValid) {
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

                        await context.read<UserService>().addUser(userModel);
                      }
                    },
                    child: Text(
                      LocaleKeys.register.tr(),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SignUpMethods.goToSignInOrRegisterPage(
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
