import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ActionsIntro extends StatelessWidget {
  PageController pageController;
  ActionsIntro({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => pageController.jumpToPage(2),
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
              controller: pageController,
              count: 3,
              effect: WormEffect(
                dotWidth: 12,
                dotHeight: 12,
                spacing: 13,
                dotColor: Colors.black26,
                activeDotColor: Colors.teal.shade700,
              ),
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: Duration(microseconds: 500), curve: Curves.easeIn),
            ),
          ),
          TextButton(
            onPressed: () => pageController.nextPage(
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
}
