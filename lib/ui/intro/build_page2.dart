import 'package:flutter/material.dart';

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
