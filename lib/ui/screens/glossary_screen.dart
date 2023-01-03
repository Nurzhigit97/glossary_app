import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/ui/authScreens/registered_dialog.dart';
import 'package:glossary_app/ui/drawerPages/drawer_page.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';

class GlossaryScreen extends StatefulWidget {
  GlossaryScreen({super.key});

  @override
  State<GlossaryScreen> createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final resData = context.read<GlossaryCubit>();

    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Image.asset(
          'assets/logoGlossary.png',
          width: 200,
        ),
        actions: [
          RegisteredDialog(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 15, right: 10),
        child: Column(
          children: [
            // sortBtns(context),
            //! Search
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) async {
                  await resData.fetchGlossary(textEditingController.text);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Поиск...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            GlossaryUi(controller: textEditingController),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
