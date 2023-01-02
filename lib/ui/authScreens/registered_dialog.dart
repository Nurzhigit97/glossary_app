import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';

class RegisteredDialog extends StatelessWidget {
  static String route = 'registeredDialog';
  const RegisteredDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          insetPadding: EdgeInsets.only(bottom: 250),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          title: Row(
            children: [
              Text(user?.email != null ? '${user?.email}' : 'Авторизоваться'),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed(SignIn.route);
                },
              ),
            ],
          ),
          content: const Text('Welcome to my Glossary App'),
          actions: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Выйти'),
              onPressed: () async {
                // final prefs = await SharedPreferences.getInstance();
                // prefs.setBool('showHome', false);
                await FirebaseAuth.instance.signOut();
              },
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Закрыть'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      icon: Icon(Icons.person),
    );
  }
}
