import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/ui/drawer_pages/history_page.dart';
import 'package:glossary_app/ui/screens/home_page.dart';

//! question its true or not
final _dio = Dio();

// ignore: must_be_immutable
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  GlossaryRepo _glossaryRepo = GlossaryRepo(_dio);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlossaryCubit(_glossaryRepo),
        ),
        BlocProvider(
          create: (context) => IsFavouriteCubit(_glossaryRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/history': (context) => HistoryPage(),
        },
      ),
    );
  }
}
