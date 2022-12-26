import 'package:flutter/material.dart';

class AddGlossary extends StatefulWidget {
  const AddGlossary({Key? key}) : super(key: key);

  @override
  _AddGlossaryState createState() => _AddGlossaryState();
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _AddGlossaryState extends State<AddGlossary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 22, 82, 131),
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
                  width: 300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController,
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
                controller: descriptionController,
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
