import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.e}) : super(key: key);
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
              // Text(widget.e.birthday),
            ],
          ),
        ),
      ),
    );
  }
}
