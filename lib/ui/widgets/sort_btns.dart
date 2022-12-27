import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';

sortBtns(BuildContext context) {
  final resData = context.read<GlossaryCubit>();
  List<String> alphabet = [
    'Все',
    'А',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  return Container(
    height: 50,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: alphabet.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 5),
          child: OutlinedButton(
            child: Text(
              alphabet[index],
            ),
            onPressed: () {
              print(alphabet[index]);
              resData.fetchGlossary(alphabet[index]);
            },
          ),
        ),
      ),
    ),
  );
}
