import 'package:flutter/material.dart';
import 'package:glossary_app/ui/authScreens/sign_in.dart';
import 'package:glossary_app/ui/authScreens/sign_up.dart';
import 'package:glossary_app/ui/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  static String route = 'introScreen';

  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();

  bool isLastPage = false;
  openHomeScreen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                colorIntro: Color.fromARGB(255, 44, 136, 148),
                title: 'Добро пожаловать ',
                subTitle: '',
                urlImg: 'assets/addGlossary.png',
              ),
              introPage2(),
              lastIntro(),
            ],
          ),
          bottomSheet: isLastPage ? isLast(context) : actionsIntro(),
        );
      }),
    );
  }

  Widget actionsIntro() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => controller.jumpToPage(2),
            child: Text(
              'Пропустить',
              style: TextStyle(
                  color: Color.fromARGB(255, 44, 136, 148),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                dotWidth: 12,
                dotHeight: 12,
                spacing: 13,
                dotColor: Colors.black26,
                activeDotColor: Colors.teal.shade700,
              ),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(microseconds: 500), curve: Curves.easeIn),
            ),
          ),
          TextButton(
            onPressed: () => controller.nextPage(
              duration: Duration(microseconds: 500),
              curve: Curves.easeInOut,
            ),
            child: Text(
              'Далее',
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 44, 136, 148),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget introPage2() {
    Widget rowWidgets({required Icon iconInfo, required String text}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconInfo,
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      );
    }

    return Container(
      color: Color.fromARGB(255, 44, 136, 148),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Глоссарий',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                rowWidgets(
                  iconInfo: Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  text: 'Добавление в избранные',
                ),
                rowWidgets(
                  iconInfo: Icon(
                    Icons.task_outlined,
                    color: Color.fromARGB(255, 19, 201, 34),
                  ),
                  text: 'Пройти тест на знание глоссариев',
                ),
                rowWidgets(
                  iconInfo: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 13, 50, 214),
                  ),
                  text: 'Найти интересующие вас глоссарии',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildPage(
          {Color? colorIntro,
          String? title,
          String? urlImg,
          List<Widget>? widgets,
          String? subTitle}) =>
      Container(
        color: colorIntro,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    subTitle.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              urlImg.toString(),
            ),
          ],
        ),
      );

  Container lastIntro() {
    return Container(
      color: Color.fromARGB(255, 44, 136, 148),
    );
  }

  Widget isLast(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 44, 136, 148),
          minimumSize: const Size.fromHeight(800),
        ),
        onPressed: openHomeScreen,
        child: Text(
          'Войти',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
