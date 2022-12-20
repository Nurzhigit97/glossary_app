import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/app.dart';
import 'package:glossary_app/cubits/glossary_cubit.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

void main() {
  final _dio = Dio();
  final _repository = GlossaryRepo(_dio);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: ((context) => GlossaryCubit(_repository))),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}
