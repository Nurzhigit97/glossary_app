import 'package:flutter/material.dart';
import 'package:glossary_app/ui/drawer_pages/about_page.dart';
import 'package:glossary_app/ui/drawer_pages/add_glossary.dart';
import 'package:glossary_app/ui/drawer_pages/favourite_page.dart';
import 'package:glossary_app/ui/drawer_pages/test_page.dart';
import 'package:glossary_app/ui/screens/glossary_screen.dart';

class BottomPersist {
  static final screens = [
    GlossaryScreen(),
    FavouritePage(),
    AddGlossary(),
    AboutPage(),
    TestPage(),
  ];

  static final items = [
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
