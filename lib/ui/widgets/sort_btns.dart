import 'package:flutter/material.dart';

class SortBtns extends StatefulWidget {
  const SortBtns({Key? key}) : super(key: key);

  @override
  _SortBtnsState createState() => _SortBtnsState();
}

class _SortBtnsState extends State<SortBtns> {
  List<String> alphabet = [
    'Все',
    '0-9',
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

  @override
  Widget build(BuildContext context) {
    return //! Buttons
        Container(
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
