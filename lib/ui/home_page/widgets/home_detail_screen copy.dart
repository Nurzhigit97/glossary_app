// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/ui/home_page/widgets/prev_next.dart';
import 'package:number_paginator/number_paginator.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

// ignore: must_be_immutable
class HomeDetailScreen extends StatefulWidget {
  int id;

  HomeDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<HomeDetailScreen> createState() => _PrevNextState();
}

class _PrevNextState extends State<HomeDetailScreen> {
  late final GlossaryRepo _glossaryRepo;

  GlossaryModel? data;
  final _controllerNumber = NumberPaginatorController();
  int _numPages = GlossaryRepo.lenData - 1;
  late int _currentPage;
  late int indexGlossary = _currentPage;
  late String prevTitle;
  late String nextTitle;

  @override
  void initState() {
    _currentPage = widget.id;
    _glossaryRepo = context.read<GlossaryRepo>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GlossaryModel?>(
      future: _glossaryRepo.getGlossary(id: '${_currentPage}'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          GlossaryModel? glossary = snapshot.data;
          data = glossary;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Глоссарий'),
                actions: [
                  IconButton(
                    onPressed: () {
                      _glossaryRepo.updateFavourite(
                          id: glossary.id!, isFavourite: !glossary.isFavourite);
                    },
                    icon: Icon(Icons.star,
                        color: glossary!.isFavourite != true
                            ? Color.fromARGB(255, 255, 255, 255)
                            : Color.fromARGB(255, 241, 199, 11)),
                  ),
                ],
              ),

              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${data?.title}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${data?.description}',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // card for elevation
              bottomNavigationBar: Card(
                margin: EdgeInsets.zero,
                elevation: 4,
                child: NumberPaginator(
                  controller: _controllerNumber,
                  config:
                      NumberPaginatorUIConfig(mode: ContentDisplayMode.numbers),
                  contentBuilder: (index) {
                    return Expanded(
                      child: PrevNext(
                          glossaryRepo: _glossaryRepo,
                          currentPage: _currentPage),
                    );
                  },
                  numberPages: _numPages,
                  onPageChange: (int index) {
                    setState(() {
                      if (index == _numPages) return;
                      if (index < 1) return;
                      _currentPage = index;
                    });
                  },
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
