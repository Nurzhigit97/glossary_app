import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions { clearCash, clearCookies }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late WebViewController _webViewController;
  double progress = 0;
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
          body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://termin.unitedyouth.org.kg',
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
          ),
        ),
      ),
    );
  }
}
