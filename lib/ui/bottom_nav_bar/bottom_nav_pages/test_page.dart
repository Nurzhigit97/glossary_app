// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class TestPage extends StatelessWidget {
  TestPage({
    super.key,
  });

  late WebViewController webViewController;

  double isLoading = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.testTitle.tr()),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: isLoading,
            color: Color.fromARGB(115, 57, 66, 139),
          ),
          Expanded(
            child: WebView(
              onProgress: (progress) {
                this.isLoading = progress / 100;
              },
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'https://docs.google.com/forms/d/e/1FAIpQLSe_GlbHZ-7P-la4nhI5BQ9myTVlyXEyreFIURHhRGoZmIMDdQ/viewform',
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
