import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:passwordfield/passwordfield.dart';

class SignUp extends StatefulWidget {
  static String route = 'signUp';

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                    image: AssetImage('assets/auth/signUp.webp'),
                    width: 250,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                    suffixIcon: Icon(Icons.alternate_email_sharp),
                    hintText: 'Введите email...',
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
                  hintText: 'Введите password...',
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
                      'must contain special character either . * @ # \$',
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Зарегистрироваться'),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account'),
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
