import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_state.dart';
import 'package:glossary_app/ui/globalWidgets/glossary_view.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    final resData = context.read<IsFavouriteCubit>();
    resData.fetchGlossaryFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 22, 82, 131),
        title: Text('Избранные'),
      ),
      body: Column(
        children: [
          Container(
            child: BlocBuilder<IsFavouriteCubit, IsfavouriteState>(
              builder: ((context, state) {
                if (state is IsfavouriteError) {
                  return Center(
                    child: Text(
                      '${state.errMsg}',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  );
                }
                if (state is IsfavouriteLoaded) {
                  final dataFavourites = state.glossaryFavourite;
                  return Expanded(
                    child: GlossaryView.buildList(data: dataFavourites),
                  );
                }
                return Center(child: LinearProgressIndicator());
              }),
            ),
          ),
        ],
      ),
    );
  }
}
