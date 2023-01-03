import 'package:flutter/material.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class DetailScreen extends StatelessWidget {
  final int? id;
  DetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GlossaryModel?>(
      future: GlossaryRepo().getGlossary(id: '$id'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          GlossaryModel? glossary = snapshot.data;

          if (glossary != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text('${glossary.title}'),
                actions: [
                  IconButton(
                    onPressed: () {
                      GlossaryRepo().updateFavourite(
                          id: glossary.id!, isFavourite: !glossary.isFavourite);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.star,
                        color: glossary.isFavourite != true
                            ? Color.fromARGB(255, 255, 255, 255)
                            : Color.fromARGB(255, 241, 199, 11)),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        '${glossary.description}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
