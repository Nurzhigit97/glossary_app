import 'package:flutter/material.dart';
import 'package:glossary_app/ui/widgets/bottom_nav_bar_persis.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static String route = '/';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: BottomPersist.screens(),
        items: BottomPersist.items(),
      ),
    );
  }
}
