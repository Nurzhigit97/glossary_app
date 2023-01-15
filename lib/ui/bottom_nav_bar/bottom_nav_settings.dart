import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_pages/about_page.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_pages/add_glossary.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_pages/favourite_page.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_pages/test_page.dart';
import 'package:glossary_app/ui/home_page/home_page.dart';

class BottomNavSettings {
  static List<Widget> screens() {
    return [
      HomePage(),
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
        label: LocaleKeys.home.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: LocaleKeys.favourite.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box_rounded),
        label: LocaleKeys.add.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.text_snippet_outlined,
        ),
        label: LocaleKeys.about.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.checklist_outlined),
        label: LocaleKeys.test.tr(),
      ),
    ];
  }
}
