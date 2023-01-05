import 'package:flutter/material.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:number_paginator/number_paginator.dart';

class PrevNext extends StatefulWidget {
  int id;
  PrevNext({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PrevNext> createState() => _PrevNextState();
}

class _PrevNextState extends State<PrevNext> {
  GlossaryModel? data;
  final _controllerNumber = NumberPaginatorController();
  int _numPages = GlossaryRepo.lenData;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GlossaryModel?>(
      future: GlossaryRepo().getGlossary(id: '${_currentPage}'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          GlossaryModel? glossary = snapshot.data;
          data = glossary;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Глоссарий'),
                actions: [
                  IconButton(
                    onPressed: () {
                      GlossaryRepo().updateFavourite(
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
                      PrevNextGlossary(
                          currentPage: _currentPage,
                          controllerNumber: _controllerNumber),
                      SizedBox(height: 30),
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
                  numberPages: _numPages,
                  onPageChange: (int index) {
                    setState(() {
                      if (index <= 0) return;
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

class PrevNextGlossary extends StatelessWidget {
  const PrevNextGlossary({
    Key? key,
    required int currentPage,
    required NumberPaginatorController controllerNumber,
  })  : _currentPage = currentPage,
        _controllerNumber = controllerNumber,
        super(key: key);

  final int _currentPage;
  final NumberPaginatorController _controllerNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //prev Button
        FutureBuilder<GlossaryModel?>(
          future: GlossaryRepo().getGlossary(id: '${_currentPage - 1}'),
          builder: ((context, snapshot) {
            GlossaryModel? glossary = snapshot.data;
            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: ListTile(
                  onTap: () async {
                    if (glossary?.title == null) return;
                    _controllerNumber.prev();
                  },
                  title: Text(
                    '${glossary?.title != null ? glossary?.title!.split('—').first : '-'}',
                    style: TextStyle(color: Colors.blue),
                  ),
                  leading: Icon(Icons.arrow_circle_left_outlined,
                      color: Colors.blue),
                ),
              ),
            );
          }),
        ),
        //next Button
        FutureBuilder<GlossaryModel?>(
          future: GlossaryRepo().getGlossary(id: '${_currentPage + 1}'),
          builder: ((context, snapshot) {
            GlossaryModel? glossary = snapshot.data;
            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: ListTile(
                  onTap: () async {
                    if (glossary?.title == null) return;
                    _controllerNumber.next();
                  },
                  title: Text(
                    '${glossary?.title != null ? glossary?.title!.split('—').first : '-'}',
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
