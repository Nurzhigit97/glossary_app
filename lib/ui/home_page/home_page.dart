import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/cubits/Glossary_cubit.dart';
import 'package:glossary_app/cubits/theme_cubit.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/registered_dialog.dart';
import 'package:glossary_app/ui/drawer_page/drawer_page.dart';
import 'package:glossary_app/ui/home_page/check_internet.dart';
import 'package:glossary_app/ui/home_page/home_list_glossary_with_hightLightText.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    final resData = context.read<GlossaryCubit>();
    resData.fetchGlossary('');
    super.initState();
  }

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
          CheckInternet(),
          RegisteredDialog(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 15, right: 10),
        child: Column(
          children: [
            // SortBtns(),
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
                  hintText: LocaleKeys.search.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            // Glossaries List
            HomeListListWithHighLightText(
                textEditingController: textEditingController),
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
