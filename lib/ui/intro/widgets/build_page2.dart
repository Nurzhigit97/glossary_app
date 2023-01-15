import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/intro/widgets/is_last_page.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 44, 136, 148),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            LocaleKeys.nameApp.tr(),
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
                  text: LocaleKeys.addFavourite.tr(),
                ),
                rowWidgets(
                  iconInfo: Icon(
                    Icons.task_outlined,
                    color: Color.fromARGB(255, 19, 201, 34),
                  ),
                  text: LocaleKeys.testGlossary.tr(),
                ),
                rowWidgets(
                  iconInfo: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 13, 50, 214),
                  ),
                  text: LocaleKeys.searchLikeGlosssary.tr(),
                ),
              ],
            ),
          ),
          IsLastPage(),
        ],
      ),
    );
  }

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
}
