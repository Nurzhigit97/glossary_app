// import 'package:flutter/material.dart';
// import 'package:glossary_app/blocs/bloc/isfavourite_bloc.dart';

// class FavouritePage extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Checkout')),
//       body: StreamBuilder(
//         stream: bloc.getStream,
//         initialData: bloc.list,
//         builder: (context, snapshot) {
//           return Column(
//             children: <Widget>[
//               Expanded(child: checkoutListBuilder(snapshot)),
//               SizedBox(height: 40)
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// Widget checkoutListBuilder(snapshot) {
//   return ListView.builder(
//     itemCount: snapshot.data.length,
//     itemBuilder: (_, i) {
//       var cartList = snapshot.data;
//       return ListTile(
//         title: Text(cartList[i]['title']),
//         subtitle: Text(cartList[i]['description']),
//         trailing: IconButton(
//           icon: Icon(Icons.remove_shopping_cart),
//           onPressed: () {
//             bloc.removeFromCart(cartList[i]);
//           },
//         ),
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_cubit.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_state.dart';
import 'package:glossary_app/ui/screens/detail.dart';

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
                  final data = state.glossaryFavourite;
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
          ),
        ],
      ),
    );
  }
}
