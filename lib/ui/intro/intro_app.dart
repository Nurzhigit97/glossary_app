import 'package:flutter/material.dart';
import 'package:glossary_app/ui/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroApp extends StatefulWidget {
  const IntroApp({Key? key}) : super(key: key);

  @override
  _IntroAppState createState() => _IntroAppState();
}

class _IntroAppState extends State<IntroApp> {
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
          buildPage(
            colorIntro: Color.fromARGB(255, 44, 136, 148),
            title: 'Добро пожаловать ',
            subTitle: '',
            urlImg: 'assets/addGlossary.png',
          ),
          Container(
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
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      label: Text(
                        'Добавление в избранные',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.task_outlined,
                        color: Color.fromARGB(255, 25, 184, 25),
                      ),
                      label: Text(
                        'Пройти тест на знание глоссариев',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 9, 74, 214),
                      ),
                      label: Text(
                        'Найти интересующие вас глоссарии',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 44, 136, 148),
          ),
        ],
      ),
      bottomSheet: isLastPage
          ? Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 136, 148),
                  minimumSize: const Size.fromHeight(800),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Войти',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          : Container(
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
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn),
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
            ),
    );
  }

  buildPage(
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
}
