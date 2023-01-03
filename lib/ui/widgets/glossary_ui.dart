import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/ui/globalWidgets/method_highlight.dart';
import 'package:glossary_app/ui/screens/detail_screen.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';

class GlossaryUi extends StatefulWidget {
  const GlossaryUi({Key? key}) : super(key: key);

  @override
  State<GlossaryUi> createState() => _GlossaryUiState();
}

class _GlossaryUiState extends State<GlossaryUi> {
  @override
  void initState() {
    final resData = context.read<GlossaryCubit>();
    resData.fetchGlossary('');
    super.initState();
  }

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
                      final getSearchValue =
                          SearchGlossary.textEditingController.text;
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
                              title: RichText(
                                text: TextSpan(
                                  children: highlightOccurrences(
                                      source: '${glossary.title}',
                                      query: getSearchValue),
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
