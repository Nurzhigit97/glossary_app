import 'package:flutter/material.dart';

class SearchGlossary extends StatefulWidget {
  const SearchGlossary({Key? key}) : super(key: key);

  @override
  _SearchGlossaryState createState() => _SearchGlossaryState();
}

TextEditingController textEditingController = TextEditingController();

class _SearchGlossaryState extends State<SearchGlossary> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: () {
        setState(() {});
      },
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: 'Поиск...',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
      ),
    );
  }
}
