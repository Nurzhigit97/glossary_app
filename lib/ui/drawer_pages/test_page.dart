// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestPage extends StatefulWidget {
  TestPage({
    super.key,
  });

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late WebViewController webViewController;

  double isLoading = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Тест на знание'),
        backgroundColor: Colors.black,
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
                setState(() {});
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
