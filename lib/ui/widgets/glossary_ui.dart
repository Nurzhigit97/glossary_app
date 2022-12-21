import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/ui/screens/detail.dart';

class GlossaryUi extends StatelessWidget {
  const GlossaryUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    List<String> alphabet = [
      'Все',
      '0-9',
      'А',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];

    final resData = context.read<GlossaryCubit>();
    resData.fetchGlossary(textEditingController.text);
    return BlocBuilder<GlossaryCubit, GlossaryState>(
      builder: ((context, state) {
        if (state is ErrorGlossaryState) {
          return Center(
            child: Text(
              '${state.errMsg}',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        }
        if (state is LoadedGlossaryState) {
          final data = state.glossary;
          return Column(
            children: [
              TextField(
                controller: textEditingController,
                onEditingComplete: () {
                  resData.fetchGlossary(textEditingController.text);
                },
                decoration: InputDecoration(
                  hintText: 'Поиск...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                ),
              ),
              Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: alphabet.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: OutlinedButton(
                        child: Text(
                          alphabet[index],
                        ),
                        onPressed: () {
                          print(alphabet[index]);
                          resData.fetchGlossary(alphabet[index]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final glossary = data[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            e: glossary,
                          ),
                        ),
                      ),
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: ListTile(
                          title: Text('${glossary.title}'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Center(
          child: LinearProgressIndicator(),
        );
      }),
    );
  }
}
