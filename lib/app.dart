import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:glossary_app/ui/screens/footer.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions { clearCash, clearCookies }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late WebViewController _webViewController;
  List<String> alphabet = [
    'Все',
    '0-9',
    'А',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
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
          endDrawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Image.asset(
              'assets/logoGlossary.png',
              width: 200,
            ),
          ),

          //!
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Поиск...',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.zero)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Глоссарий по Информатике на кыргызском языке',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //! Buttons
                          Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: alphabet.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: OutlinedButton(
                                    child: Text(
                                      alphabet[index],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* Container(
                      height: 600,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://termin.unitedyouth.org.kg',
                        onWebViewCreated: (controller) {
                          _webViewController = controller;
                        },
                      ),
                    ), */
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
