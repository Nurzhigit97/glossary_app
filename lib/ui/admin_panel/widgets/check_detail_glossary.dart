import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/check_glossary_repo.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';

class CheckDetailGlossary extends StatelessWidget {
  final int? id;
  CheckDetailGlossary({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkDetailRepo = context.read<CheckGlossaryRepo>();
    return FutureBuilder<GlossaryModel?>(
      future: checkDetailRepo.getGlossary(id: '$id'),
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
                    context
                        .read<GlossaryRepo>()
                        .addGlossary(modelGlossary: checked);
                    checkDetailRepo.deleteGlossaryAafterChecked(
                      id: glossary.id.toString(),
                    );
                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.add.tr()),
                ),
                TextButton(
                  onPressed: () {
                    checkDetailRepo.deleteGlossaryAafterChecked(
                      id: glossary.id.toString(),
                    );

                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.cancel.tr()),
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
