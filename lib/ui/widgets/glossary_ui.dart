import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';
import 'package:glossary_app/ui/screens/detail.dart';

class GlossaryUi extends StatefulWidget {
  const GlossaryUi({Key? key}) : super(key: key);

  @override
  _GlossaryUiState createState() => _GlossaryUiState();
}

class _GlossaryUiState extends State<GlossaryUi> {
  final GlossaryRepo _client = GlossaryRepo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _client.getGlossary(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GlossaryModel>? userInfo = snapshot.data;

          if (userInfo != null) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              child: ListView.builder(
                primary: false,
                itemCount: userInfo.length,
                itemBuilder: ((context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                e: userInfo[index],
                              ),
                            ),
                          ),
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: ListTile(
                              title: Text('${userInfo[index].title}'),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
