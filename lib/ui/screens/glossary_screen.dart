import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:glossary_app/ui/drawerScreens/drawer_page.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';

class GlossaryScreen extends StatelessWidget {
  GlossaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Image.asset(
          'assets/logoGlossary.png',
          width: 200,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              _dialogBuilder(context);
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 15, right: 10),
        child: Column(
          children: [
            SearchGlossary().search(context),
            // sortBtns(context),
            // TitleApp(),
            GlossaryUi(),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        User? user = FirebaseAuth.instance.currentUser;
        return AlertDialog(
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
                  Navigator.of(context).pushNamed(SignIn.route);
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
        );
      },
    );
  }
}
