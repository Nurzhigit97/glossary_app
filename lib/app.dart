import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:glossary_app/data/repositories/glossary_service.dart';
import 'package:glossary_app/ui/drawer_pages/drawer_page.dart';
import 'package:glossary_app/ui/screens/footer.dart';
import 'package:glossary_app/ui/widgets/glossary_ui.dart';
import 'package:glossary_app/ui/widgets/search_glossary.dart';
import 'package:glossary_app/ui/widgets/sort_btns.dart';
import 'package:glossary_app/ui/widgets/title_app.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions { clearCash, clearCookies }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late WebViewController _webViewController;

  final ApiServices _client = ApiServices();

  @override
  Widget build(BuildContext context) {
    //! on Tap to smartphone back
    return WillPopScope(
      onWillPop: () async {
        //! can't go out from app
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
        } else {
          log('Нет записи в истории');
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          endDrawer: DrawerPage(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Image.asset(
              'assets/logoGlossary.png',
              width: 200,
            ),
          ),

          //!
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                child: Column(
                  children: [
                    //! Search page
                    SearchGlossary(),
                    //! title app
                    TitleApp(),
                    //! sort btns
                    SortBtns(),
                    //! UI from glossaries
                    GlossaryUi(),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
