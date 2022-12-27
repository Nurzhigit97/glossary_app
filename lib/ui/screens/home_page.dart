import 'package:flutter/material.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerPage(),
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
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => IntroApp(),
                ),
              );
            },
            icon: Icon(Icons.logout),
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
}
