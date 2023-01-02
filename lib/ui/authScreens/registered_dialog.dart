import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';

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
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          content: Container(
            constraints: BoxConstraints(maxHeight: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FirebaseAuth.instance.currentUser != null
                    ? Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('${user?.photoURL}'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('${user?.displayName}'),
                          Text('${user?.email}'),
                        ],
                      )
                    : Text('Пройти авторизацию'),
              ],
            ),
          ),
          actions: <Widget>[
            FirebaseAuth.instance.currentUser == null
                ? ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text(
                      'Логин',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.of(context)
                          .pushReplacementNamed(SignIn.route);
                    },
                  )
                : ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Выйти'),
                    onPressed: () async {
                      // final prefs = await SharedPreferences.getInstance();
                      // prefs.setBool('showHome', false);
                      await FirebaseAuth.instance.signOut();
                      await Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.route);
                    },
                  ),
          ],
        ),
      ),
      icon: Icon(Icons.person),
    );
  }
}
