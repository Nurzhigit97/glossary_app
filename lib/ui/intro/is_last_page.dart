import 'package:flutter/material.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsLastPage extends StatelessWidget {
  const IsLastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> openHomeScreen() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('showHome', true);
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    }

    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 44, 136, 148),
          minimumSize: const Size.fromHeight(800),
        ),
        onPressed: openHomeScreen,
        child: Text(
          'Войти',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
