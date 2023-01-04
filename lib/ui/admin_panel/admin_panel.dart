import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/check_glossary_repo.dart';
import 'package:glossary_app/ui/admin_panel/widgets/check_detail_glossary.dart';

class AdminPanel extends StatefulWidget {
  static String route = 'adminPanel';
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GlossaryModel>>(
      future: CheckGlossaryRepo().getGlossariesAddedByUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GlossaryModel>? glossary = snapshot.data;

          if (glossary != null) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('AdminPanel'),
              ),
              body: ListView.builder(
                itemCount: glossary.length,
                itemBuilder: (context, index) {
                  final glossaries = glossary[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CheckDetailGlossary(
                                id: glossaries.id,
                              ),
                            ),
                          ),
                          leading: Text(glossaries.title.toString()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
