import 'package:flutter/material.dart';
import 'package:glossary_app/ui/intro/widgets/actions_intro.dart';
import 'package:glossary_app/ui/intro/widgets/build_pages.dart';
import 'package:glossary_app/ui/intro/widgets/build_page2.dart';

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
        onPageChanged: (value) {
          setState(() {
            isLastPage = value == 1;
          });
        },
        children: [
          BuildPages(
            colorIntro: Color.fromARGB(255, 44, 136, 148),
            title: 'Добро пожаловать ',
            subTitle: '',
            urlImg: 'assets/addGlossary.png',
          ),
          IntroPage2(),
        ],
      ),
      bottomSheet:
          ActionsIntro(pageController: controller, isLastPage: isLastPage),
    );
  }
}
