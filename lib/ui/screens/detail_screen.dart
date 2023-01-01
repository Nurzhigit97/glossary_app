import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    Key? key,
    required this.e,
  }) : super(key: key);
//! got user details
  final GlossaryModel e;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.e.title}'),
        actions: [
          IconButton(
            onPressed: () {
              GlossaryRepo(dio).updateFavourite(
                  id: widget.e.id, isFavourite: !widget.e.isFavourite);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.star,
                color: widget.e.isFavourite != true
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
                '${widget.e.description}',
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
