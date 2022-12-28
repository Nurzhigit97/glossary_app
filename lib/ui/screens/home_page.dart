import 'package:flutter/material.dart';
import 'package:glossary_app/ui/widgets/bottom_nav_bar_persis.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: BottomPersist.screens,
      items: BottomPersist.items,
    );
  }
}
