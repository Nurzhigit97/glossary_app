import 'package:flutter/material.dart';
import 'package:glossary_app/ui/bottom_nav_bar/bottom_nav_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsLastPage extends StatelessWidget {
  const IsLastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> openHomeScreen() async {
      final prefs = await SharedPreferences.getInstance();
      // В последнем странице Intro переключает на true
      await prefs.setBool('showHome', true);
      Navigator.pushReplacementNamed(context, BottomNavPage.route);
    }

    return IconButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(800),
      ),
      onPressed: openHomeScreen,
      icon: Icon(
        Icons.arrow_circle_right_outlined,
        color: Colors.white,
        size: 70,
      ),
    );
  }
}
