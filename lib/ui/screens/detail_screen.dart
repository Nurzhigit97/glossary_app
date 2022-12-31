// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';

import 'package:glossary_app/data/models/glossary_model.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.e.title}'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<IsFavouriteCubit>().toggleGlossaryFavourites(
                  id: widget.e.id,
                  title: widget.e.title,
                  description: widget.e.description,
                  isFavourite: !widget.e.isFavourite);
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
                  fontFamily: 'Cinzel-VariableFont_wght',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
