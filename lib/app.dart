import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/home_page.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/ui/bottomNavBar/bottom_nav_bar.dart';
import 'package:glossary_app/ui/drawer_pages/about_page.dart';
import 'package:glossary_app/ui/drawer_pages/add_glossary.dart';
import 'package:glossary_app/ui/drawer_pages/favourite_page.dart';
import 'package:glossary_app/ui/drawer_pages/test_page.dart';

final _dio = Dio();

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

List<Widget> _widgetOptions = <Widget>[
  HomePage(),
  FavouritePage(),
  AddGlossary(),
  AboutPage(),
  TestPage(),
];

class _AppState extends State<App> {
  GlossaryRepo _glossaryRepo = GlossaryRepo(_dio);
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GlossaryCubit(_glossaryRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: _widgetOptions.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: selectedIndex,
            onTapBtn: onItemTapped,
          ),
        ),
        routes: {
          '/favouritePage': (context) => FavouritePage(),
        },
      ),
    );
  }
}
