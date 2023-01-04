import 'package:flutter/material.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/check_glossary_repo.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class CheckDetailGlossary extends StatelessWidget {
  final int? id;
  CheckDetailGlossary({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GlossaryModel?>(
      future: CheckGlossaryRepo().getGlossary(id: '$id'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          GlossaryModel? glossary = snapshot.data;
          final checked = GlossaryModel(
            title: glossary!.title,
            description: glossary.description,
            isFavourite: glossary.isFavourite,
            isChecked: glossary.isChecked,
          );
          return Scaffold(
            appBar: AppBar(
              title: Text('${glossary.title}'),
              actions: [
                TextButton(
                  onPressed: () {
                    GlossaryRepo().addGlossary(modelGlossary: checked);
                    CheckGlossaryRepo().deleteGlossaryAafterChecked(
                      id: glossary.id.toString(),
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Добавить'),
                ),
                TextButton(
                  onPressed: () {
                    CheckGlossaryRepo().deleteGlossaryAafterChecked(
                      id: glossary.id.toString(),
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Отменить'),
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
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
