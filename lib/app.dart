import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/ui/screens/home_page.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/ui/drawer_pages/about_page.dart';
import 'package:glossary_app/ui/drawer_pages/add_glossary.dart';
import 'package:glossary_app/ui/drawer_pages/favourite_page.dart';
import 'package:glossary_app/ui/drawer_pages/test_page.dart';

final _dio = Dio();

class App extends StatefulWidget {
  final bool? showHome;
  App({Key? key, this.showHome}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  GlossaryRepo _glossaryRepo = GlossaryRepo(_dio);
  int selectedIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    FavouritePage(),
    AddGlossary(),
    AboutPage(),
    TestPage(),
  ];
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GlossaryCubit(_glossaryRepo),
        ),
        BlocProvider(
          create: (_) => IsFavouriteCubit(_glossaryRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: _children.elementAt(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: Color.fromARGB(255, 221, 220, 219),
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
            items: _items,
          ),
        ),
        routes: {
          '/app': (context) => App(),
          '/favourites': (context) => FavouritePage(),
        },
      ),
    );
  }

  final _items = [
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
