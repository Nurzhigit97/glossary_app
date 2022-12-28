import 'package:flutter/material.dart';
import 'package:glossary_app/ui/drawer_pages/about_page.dart';
import 'package:glossary_app/ui/drawer_pages/add_glossary.dart';
import 'package:glossary_app/ui/drawer_pages/favourite_page.dart';
import 'package:glossary_app/ui/drawer_pages/test_page.dart';
import 'package:glossary_app/ui/screens/glossary_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomPersist {
  static final List<Widget> screens = [
    GlossaryScreen(),
    FavouritePage(),
    AddGlossary(),
    AboutPage(),
    TestPage(),
  ];

  static final items = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: 'Главная',
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.favorite_border),
      title: 'Избранные',
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.add_box_rounded),
      title: 'Добавить',
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.text_snippet_outlined,
      ),
      title: 'О проекте',
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.checklist_outlined),
      title: 'Тест',
    ),
  ];
}
