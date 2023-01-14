import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/ui/app_page/widgets/app_routes.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/ui/app_page/widgets/app_theme.dart';
import 'package:glossary_app/ui/intro/intro_app.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  bool showHome;
  App(this.showHome, {Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _glossaryRepo = GlossaryRepo();
  final _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _glossaryRepo),
        RepositoryProvider.value(value: _firebaseService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GlossaryCubit(_glossaryRepo)),
          BlocProvider(create: (_) => IsFavouriteCubit(_glossaryRepo)),
        ],
        child: MaterialApp(
          theme: ThemeSettings.getTheme(),
          debugShowCheckedModeBanner: false,
          // при каждой установке приложения показывает IntroPage
          // В последнем странице IntroPage() переключает на true
          home: widget.showHome
              ? _firebaseService.handleAuthState()
              : IntroScreen(),
          routes: getRoutes(),
        ),
      ),
    );
  }
}
