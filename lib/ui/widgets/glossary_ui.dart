import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/glossary_cubit.dart';
import 'package:glossary_app/ui/screens/detail.dart';

class GlossaryUi extends StatefulWidget {
  const GlossaryUi({Key? key}) : super(key: key);

  @override
  _GlossaryUiState createState() => _GlossaryUiState();
}

class _GlossaryUiState extends State<GlossaryUi> {
  @override
  void initState() {
    final fetch = context.read<GlossaryCubit>();
    fetch.fetchGlossary();
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
        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                e: state.glossary,
              ),
            ),
          ),
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: ListTile(
              title: Text('${state.glossary.title}'),
            ),
          ),
        );
      }
      return Center(
        child: LinearProgressIndicator(),
      );
    }));
  }
}
