import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';

class ForgotPasswordPage extends StatefulWidget {
  static String route = 'forgotPassword';
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.enterEmailForResetPassword.tr()),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.enterEmail.tr(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && EmailValidator.validate(email)
                          ? LocaleKeys.emailIsValid.tr()
                          : null,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        await context.read<FirebaseService>().resetPassword(
                              context: context,
                              emailController: emailController,
                            );
                      }
                    },
                    icon: Icon(Icons.email_outlined),
                    label: Text(LocaleKeys.resetPassword.tr()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
