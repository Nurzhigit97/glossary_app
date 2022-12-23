import 'package:flutter/material.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

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
            GlossaryUi(),
          ],
        ),
      ),
    );
  }
}
