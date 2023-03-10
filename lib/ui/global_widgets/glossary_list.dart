import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/ui/screens/detail_screen.dart';

// ignore: must_be_immutable
class GlossaryList extends StatelessWidget {
  List<GlossaryModel> data;
  GlossaryList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final glossary = data[index];
        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                id: glossary.id,
              ),
            ),
          ),
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: ListTile(
              title: Text(
                glossary.title.toString(),
              ),
            ),
          ),
        );
      },
    );
  }
}
