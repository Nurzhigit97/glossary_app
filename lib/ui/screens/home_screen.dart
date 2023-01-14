import 'package:flutter/material.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_settings.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static String route = '/home';
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // BottomNavigationBar
        body: BottomNavSettings.screens().elementAt(_selectedPage),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: BottomNavSettings.items(),
          currentIndex: _selectedPage,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
