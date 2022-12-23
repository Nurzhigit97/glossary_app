import 'package:flutter/material.dart';

class AddGlossary extends StatefulWidget {
  const AddGlossary({Key? key}) : super(key: key);

  @override
  _AddGlossaryState createState() => _AddGlossaryState();
}

TextEditingController textEditingController = TextEditingController();

class _AddGlossaryState extends State<AddGlossary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Добавить глоссарий'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage('assets/addGlossary.png'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Глоссарий...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Значение...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
