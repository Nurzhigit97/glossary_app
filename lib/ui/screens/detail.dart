// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:glossary_app/data/models/glossary_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.e,
  }) : super(key: key);
//! got user details
  final GlossaryModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${e.title}'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/favouritePage');
            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                '${e.description}',
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
