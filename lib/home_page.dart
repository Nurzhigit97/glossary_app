import 'package:flutter/material.dart';
import 'package:glossary_app/ui/drawer_pages/drawer_page.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logoGlossary.png',
          width: 200,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 15, right: 10),
        child: Column(
          children: [
            search(context),
            // sortBtns(context),
            // TitleApp(),
            GlossaryUi(),
          ],
        ),
      ),
    );
  }
}
