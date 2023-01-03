import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/data/repositories/auth_service.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Введите почту для сброса пароля'),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Введите почту...',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && EmailValidator.validate(email)
                        ? 'Введите правильную почту '
                        : null,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () => AuthService().resetPassword(
                      context: context, emailController: emailController),
                  icon: Icon(Icons.email_outlined),
                  label: Text('Сбросить пароль'))
            ],
          ),
        ),
      ),
    );
  }
}
