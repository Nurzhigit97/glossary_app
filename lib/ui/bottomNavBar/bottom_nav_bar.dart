import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  int selectedIndex = 0;
  var onTapBtn;
  BottomNavBar({Key? key, required this.selectedIndex, required this.onTapBtn})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
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
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onTapBtn,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
    );
  }
}
