import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/ui/screens/detail.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';

class GlossaryView {
  static Widget buildList(
      {List<GlossaryModel>? data, Function? highlightOccurrences}) {
    final getSearchValue = SearchGlossary.textEditingController.text;

    print(getSearchValue);
    return ListView.builder(
      itemCount: data!.length,
      itemBuilder: (context, index) {
        final glossary = data[index];
        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                e: glossary,
              ),
            ),
          ),
          child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 3),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    children: highlightOccurrences!(
                        source: '${glossary.title}', query: getSearchValue),
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              )),
        );
      },
    );
  }
}
