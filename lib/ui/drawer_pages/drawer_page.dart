import 'package:flutter/material.dart';
import 'package:glossary_app/ui/drawer_pages/about_page.dart';
import 'package:glossary_app/ui/drawer_pages/history_page.dart';
import 'package:glossary_app/ui/drawer_pages/test_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.6,
                colorFilter: ColorFilter.srgbToLinearGamma(),
                image: AssetImage('assets/Glossary-of-Banking-Terms-RVR-1.jpg'),
              ),
            ),
            child: Text(
              'Глоссарий информатика',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
            ),
          ),
          ListTile(
            title: const Text('О проекте'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('История'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HistoryPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Тест на знание'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TestPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
