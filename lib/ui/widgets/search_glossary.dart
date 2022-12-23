import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';

//! I dont create StateFul or stateLess, create only function because it cant find true(right) context
search(BuildContext context) {
  final resData = context.read<GlossaryCubit>();

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextField(
      controller: textEditingController,
      onChanged: (value) {
        resData.fetchGlossary(textEditingController.text);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        hintText: 'Поиск...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}

TextEditingController textEditingController = TextEditingController();
