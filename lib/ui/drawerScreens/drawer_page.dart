import 'package:flutter/material.dart';
import 'package:glossary_app/ui/drawerScreens/history_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 200,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.6,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image:
                      AssetImage('assets/Glossary-of-Banking-Terms-RVR-1.jpg'),
                ),
              ),
              child: Text(
                'Глоссарий информатика',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('История'),
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(HistoryPage.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
