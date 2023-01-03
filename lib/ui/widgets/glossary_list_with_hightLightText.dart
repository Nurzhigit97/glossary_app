import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/ui/globalWidgets/method_highlight.dart';
import 'package:glossary_app/ui/screens/detail_screen.dart';

class GlossaryListWithHighLightText extends StatelessWidget {
  const GlossaryListWithHighLightText({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
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
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.glossary.length,
                    itemBuilder: (context, index) {
                      final glossary = state.glossary[index];
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              id: glossary.id,
                            ),
                          ),
                        ),
                        child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  // при поиске открашивать задний фон найденных букв или слов на зеленый
                                  children: highlightOccurrences(
                                      source: '${glossary.title}',
                                      query: textEditingController.text),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Center(child: LinearProgressIndicator());
      }),
    );
  }
}
