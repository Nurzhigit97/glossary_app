import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ActionsIntro extends StatelessWidget {
  PageController pageController;
  bool isLastPage;
  ActionsIntro(
      {Key? key, required this.pageController, required this.isLastPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLastPage == false
              ? TextButton(
                  onPressed: () => pageController.jumpToPage(1),
                  child: Text(
                    LocaleKeys.skip.tr(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 44, 136, 148),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : SizedBox.shrink(),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2,
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
          isLastPage == false
              ? TextButton(
                  onPressed: () => pageController.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                  child: Text(
                    LocaleKeys.next.tr(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 44, 136, 148),
                        fontWeight: FontWeight.bold),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
