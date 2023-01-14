import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class DetailScreen extends StatefulWidget {
  final int? id;
  DetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final detailGlossary = context.watch<GlossaryRepo>();
    return FutureBuilder<GlossaryModel?>(
      future: detailGlossary.getGlossary(id: '${widget.id}'),
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
                      detailGlossary.updateFavourite(
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
