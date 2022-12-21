import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/app.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

void main() {
  runApp(MyApp());
}

final _dio = Dio();

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GlossaryRepo _glossaryRepo = GlossaryRepo(_dio);
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
        home: const App(),
      ),
    );
  }
}
