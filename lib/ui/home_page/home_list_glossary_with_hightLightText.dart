import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/cubits/theme_cubit.dart';
import 'package:glossary_app/ui/global_widgets/method_highlight.dart';
import 'package:glossary_app/ui/home_page/widgets/home_detail_screen.dart';
import 'package:glossary_app/ui/widgets/server_error.dart';

class HomeListListWithHighLightText extends StatelessWidget {
  const HomeListListWithHighLightText({
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
              child: Column(
            children: [
              serverError(state.errMsg),
            ],
          ));
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
                            builder: (context) => HomeDetailScreen(
                              id: glossary.id!,
                            ),
                          ),
                        ),
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: ListTile(
                            title: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: context.read<ThemeCubit>().isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                // при поиске открашивать задний фон найденных букв или слов на зеленый
                                children: highlightOccurrences(
                                    source: '${glossary.title}',
                                    query: textEditingController.text),
                              ),
                            ),
                          ),
                        ),
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
