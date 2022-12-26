import 'package:custom_top_navigator/custom_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/custombottomNavBarSettings/tab_navigator.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/home_page.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
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
  Widget _page = HomePage();
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _items,
            onTap: (index) {
              navigatorKey.currentState?.maybePop();
              setState(() => _page = _children[index]);
              _currentIndex = index;
            },
            currentIndex: _currentIndex,
          ),
          body: CustomTopNavigator(
            navigatorKey: navigatorKey,
            home: _page,
            pageRoute: PageRoutes.materialPageRoute,
          ),
        ),
        initialRoute: TabNavigatorRoutes.root,
        routes: {
          TabNavigatorRoutes.favourite: (context) => FavouritePage(),
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
