import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static String route = 'historyScreen';

  const HistoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 82, 131),
        title: Text('История'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              'Глоссарий: что это?',
              style: TextStyle(fontSize: 17),
            ),
            Divider(),
            Text('''
Что такое глоссарий для специалиста по переводу? В него могут входить не только переводы конкретных слов или выражений, но также их толкования, примечания и даже примеры употребления. Даже сложные узкоспециализированные словари не способны заменить глоссарий. Это инструмент, который повышает качество перевода, снижая неточности до минимума.

 Без глоссария вероятность ошибок повышается, что может затруднить работу специалистов (например, в случае, когда неверно переведены термины в инструкции) и даже испортить репутацию самого переводчика.

'''),
            Image(
              image: AssetImage('assets/Glossary-of-Banking-Terms-RVR-1.jpg'),
            ),
            Text('''
Составление глоссария может потребоваться при работе с самыми разными текстами. Это может быть как общая, так и специфическая тематика. Обычно в такой словарик включены те понятия и выражения, которые отсутствуют с обычных словарях или имеют специфическое значение. Нередко их перевод даже приходится выводить самостоятельно путём анализа и изучения документации или литературы на данную тематику.

Использование глоссария терминов актуально и для письменного, и для устного перевода. В ситуации с письменным переводом он позволяет избежать неточностей и разночтений в трактовке определённых терминов. Словарь такого типа также облегчает и ускоряет работу специалиста, поскольку вся специфическая лексика для данной тематики уже содержится в глоссарии и не нуждается в повторном переводе.

Использование глоссария в устном переводе позволяет облегчить работу переводчика, помочь ему разобраться в тематике, сделать переводной текст более понятным для тех, кто его воспринимает, а также ускорить работу специалиста. Для удобства работы переводчиков существует специальная программа Translation Memory (TM) или Память переводов (ПП). Она представляет собой базу, в которой хранятся ранее переведённые фрагменты текстов. Это позволяет быстрее и эффективнее выполнять перевод.

Когда появился глоссарий?
Этому понятию уже достаточно много лет. Первые глоссарии появились ещё в 25 веке до нашей эры. В то время на полях записывались значения различных иностранных или редких слов, именуемых глоссами. Таким образом, глоссарии оказались и в числе первых книгопечатных изданий.

Активное использование глоссариев началось в 20 веке, когда они представляли собой словари, выполненные в бумажной форме. В современных реалиях переводчики отдают предпочтение электронным носителям.

Что входит в глоссарий терминов?
Такой словарик переводчика обычно ограничивается двумя языками. Не рекомендуется записывать туда перевод одного термина на разные языки во избежание путаницы. Однако также существуют одноязычные или многоязычные глоссарии. Глоссарий может включать в себя различные лексические единицы:

слова/термины;
сокращения;
жаргоны (присущие конкретной организации или отрасли);
слоганы; описания;
устойчивые выражения;
термины без перевода (часто именуемые Not To Be Translated, ).
'''),
          ],
        ),
      ),
    );
  }
}
