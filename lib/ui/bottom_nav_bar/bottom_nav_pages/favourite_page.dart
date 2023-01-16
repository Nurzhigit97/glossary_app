import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_state.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/global_widgets/glossary_list.dart';
import 'package:glossary_app/ui/home_page/check_internet.dart';

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

  refresh() {
    final resData = context.read<IsFavouriteCubit>();
    return resData.fetchGlossaryFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.favourite.tr()),
        actions: [
          IconButton(
            onPressed: refresh,
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: BlocBuilder<IsFavouriteCubit, IsfavouriteState>(
              builder: ((context, state) {
                if (state is IsfavouriteError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckInternet(),
                      Text(
                        "DataBase Closed",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  );
                }

                if (state is IsfavouriteLoaded) {
                  final dataFavourites = state.glossaryFavourite;
                  return Expanded(
                    child: dataFavourites.isEmpty
                        ? Center(
                            child:
                                Text(LocaleKeys.dontHaveFavouriteGlossary.tr()))
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: GlossaryList(data: dataFavourites),
                          ),
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
