import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/auth_service.dart';
import 'package:glossary_app/appPage/widgets/app_routes.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/appPage/widgets/app_theme.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';

// ignore: must_be_immutable
class App extends StatelessWidget {
  bool showHome;
  App(this.showHome, {Key? key}) : super(key: key);
  GlossaryRepo _glossaryRepo = GlossaryRepo();

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
        home: showHome ? AuthService().handleAuthState() : IntroScreen(),
        routes: getRoutes(),
      ),
    );
  }
}
