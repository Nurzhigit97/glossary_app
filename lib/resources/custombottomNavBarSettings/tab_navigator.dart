import 'package:flutter/material.dart';
import 'package:glossary_app/ui/screens/home_page.dart';
import 'package:glossary_app/ui/drawer_pages/about_page.dart';
import 'package:glossary_app/ui/drawer_pages/add_glossary.dart';
import 'package:glossary_app/ui/drawer_pages/favourite_page.dart';
import 'package:glossary_app/ui/drawer_pages/test_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String favourite = '/favouritePage';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == "Page1")
      child = HomePage();
    else if (tabItem == "Page2")
      child = FavouritePage();
    else if (tabItem == "Page3")
      child = AddGlossary();
    else if (tabItem == "Page4")
      child = AboutPage();
    else if (tabItem == "Page5") child = TestPage();

    return Navigator(
      initialRoute: '/',
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (_) => child);
      },
    );
  }
}
