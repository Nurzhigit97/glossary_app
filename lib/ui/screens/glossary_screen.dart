import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/registered_dialog.dart';
import 'package:glossary_app/ui/drawerScreens/drawer_page.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';

class GlossaryScreen extends StatelessWidget {
  GlossaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Image.asset(
          'assets/logoGlossary.png',
          width: 200,
        ),
        actions: [
          RegisteredDialog(),
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
