// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';

import 'package:glossary_app/data/models/glossary_model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    Key? key,
    required this.e,
  }) : super(key: key);
//! got user details
  final GlossaryModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 82, 131),
        title: Text('${e.title}'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<IsFavouriteCubit>().toggleGlossaryFavourites(
                  id: e.id,
                  title: e.title,
                  description: e.description,
                  isFavourite: e.isFavourite);
            },
            icon: Icon(Icons.star,
                color: e.isFavourite != true
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
