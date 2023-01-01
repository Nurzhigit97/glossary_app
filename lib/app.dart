import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/resources/app_routes.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/resources/theme_app.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';

//! question its true or not
final _dio = Dio();

// ignore: must_be_immutable
class App extends StatelessWidget {
  bool showHome;
  App(this.showHome, {Key? key}) : super(key: key);
  GlossaryRepo _glossaryRepo = GlossaryRepo(_dio);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GlossaryCubit(_glossaryRepo)),
        BlocProvider(create: (_) => IsFavouriteCubit(_glossaryRepo)),
      ],
      child: MaterialApp(
        theme: ThemeSettings.getTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: showHome ? HomeScreen.route : IntroScreen.route,
        routes: getRoutes(),
      ),
    );
  }
}
