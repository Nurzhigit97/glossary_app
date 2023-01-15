import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/theme_cubit.dart';

BlocBuilder<ThemeCubit, bool> toggleTheme() {
  return BlocBuilder<ThemeCubit, bool>(
    builder: (context, state) {
      return IconButton(
        onPressed: () {
          final cubit = context.read<ThemeCubit>();
          cubit.toggleTheme(value: cubit.isDark);
        },
        icon: context.read<ThemeCubit>().isDark
            ? Icon(Icons.dark_mode_outlined)
            : Icon(Icons.light_mode_outlined),
      );
    },
  );
}
