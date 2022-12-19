import 'package:flutter/material.dart';
import 'package:glossary_app/data/repositories/glossary_service.dart';

class SearchGlossary extends StatefulWidget {
  const SearchGlossary({Key? key}) : super(key: key);

  @override
  _SearchGlossaryState createState() => _SearchGlossaryState();
}

TextEditingController textEditingController = TextEditingController();
final ApiServices _client = ApiServices();

class _SearchGlossaryState extends State<SearchGlossary> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: () {
        setState(() {
          _client.getGlossary(glossaryValue: textEditingController.text);
        });
      },
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: 'Поиск...',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
      ),
    );
  }
}
