import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/ui/widgets/glossary_view.dart';

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
                  child: GlossaryView.buildList(state.glossary),
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
