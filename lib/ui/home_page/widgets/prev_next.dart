import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class PrevNext extends StatelessWidget {
  const PrevNext({
    Key? key,
    required GlossaryRepo glossaryRepo,
    required int currentPage,
  })  : _glossaryRepo = glossaryRepo,
        _currentPage = currentPage,
        super(key: key);

  final GlossaryRepo _glossaryRepo;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //prev Button
        FutureBuilder<GlossaryModel?>(
          future: _glossaryRepo.getGlossary(id: '${_currentPage - 1}'),
          builder: ((context, snapshot) {
            GlossaryModel? glossary = snapshot.data;
            return Text(
              '${glossary?.title != null ? glossary?.title!.split('—').first : '-'}',
              style: TextStyle(color: Colors.blue),
            );
          }),
        ),
        //next Button
        FutureBuilder<GlossaryModel?>(
          future: _glossaryRepo.getGlossary(id: '${_currentPage + 1}'),
          builder: ((context, snapshot) {
            GlossaryModel? glossary = snapshot.data;
            return Text(
              '${glossary?.title != null ? glossary?.title!.split('—').first : '-'}',
              style: TextStyle(color: Colors.blue),
            );
          }),
        ),
      ],
    );
  }
}
