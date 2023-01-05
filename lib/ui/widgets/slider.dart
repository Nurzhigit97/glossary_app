import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/ui/screens/detail_screen.dart';

class Slider extends StatelessWidget {
  const Slider({
    Key? key,
  }) : super(key: key);

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
                              title: Text('Prev'),
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