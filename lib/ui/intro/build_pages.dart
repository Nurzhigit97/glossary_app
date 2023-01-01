import 'package:flutter/material.dart';

class BuildPages extends StatelessWidget {
  final Color? colorIntro;
  final String? title;
  final String? subTitle;
  final String? urlImg;
  const BuildPages(
      {Key? key,
      required this.colorIntro,
      required this.title,
      required this.subTitle,
      required this.urlImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
