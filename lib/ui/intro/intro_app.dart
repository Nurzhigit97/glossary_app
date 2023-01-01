import 'package:flutter/material.dart';
import 'package:glossary_app/ui/intro/actions_intro.dart';
import 'package:glossary_app/ui/intro/build_pages.dart';
import 'package:glossary_app/ui/intro/build_page2.dart';
import 'package:glossary_app/ui/intro/is_last_page.dart';
import 'package:glossary_app/ui/intro/build_last_page.dart';

class IntroScreen extends StatefulWidget {
  static String route = 'introScreen';

  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() => isLastPage = index == 2);
        },
        children: [
          BuildPages(
            colorIntro: Color.fromARGB(255, 44, 136, 148),
            title: 'Добро пожаловать ',
            subTitle: '',
            urlImg: 'assets/addGlossary.png',
          ),
          IntroPage2(),
          BuildLastPage(),
        ],
      ),
      bottomSheet:
          isLastPage ? IsLastPage() : ActionsIntro(pageController: controller),
    );
  }
}
