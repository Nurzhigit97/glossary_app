import 'package:flutter/material.dart';
import 'package:glossary_app/ui/drawerScreens/about_page.dart';
import 'package:glossary_app/ui/drawerScreens/add_glossary.dart';
import 'package:glossary_app/ui/drawerScreens/favourite_page.dart';
import 'package:glossary_app/ui/drawerScreens/test_page.dart';
import 'package:glossary_app/ui/screens/glossary_screen.dart';

class BottomNavSettings {
  static List<Widget> screens() {
    return [
      GlossaryScreen(),
      FavouritePage(),
      AddGlossary(),
      AboutPage(),
      TestPage(),
    ];
  }

  static List<BottomNavigationBarItem> items() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Главная',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Избранные',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box_rounded),
        label: 'Добавить',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.text_snippet_outlined,
        ),
        label: 'О проекте',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.checklist_outlined),
        label: 'Тест',
      ),
    ];
  }
}
