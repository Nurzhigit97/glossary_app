import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/glossary_state.dart';
import 'package:glossary_app/ui/screens/detail.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    final resData = context.read<GlossaryCubit>();
    resData.fetchGlossary('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Избранные'),
      ),
      body: Container(
        child: Column(
          children: [
            BlocBuilder<GlossaryCubit, GlossaryState>(
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
                  return Expanded(
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
                  );
                }
                return Center(child: LinearProgressIndicator());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
