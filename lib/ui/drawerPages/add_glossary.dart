import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

Dio? dio;

class AddGlossary extends StatefulWidget {
  const AddGlossary({Key? key}) : super(key: key);

  @override
  _AddGlossaryState createState() => _AddGlossaryState();
}

class _AddGlossaryState extends State<AddGlossary> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Добавить глоссарий'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FirebaseAuth.instance.currentUser == null
                  ? Text('Чтобы добавить вам нужно авторизоваться')
                  : SizedBox.shrink(),
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
                  hintText: 'Термин...',
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
                  hintText: 'Описание...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (FirebaseAuth.instance.currentUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Пройдите авторизацию для отправки'),
                      ),
                    );
                  }
                  if (FirebaseAuth.instance.currentUser == null) return;
                  if (titleController.text != '' &&
                      descriptionController.text != '') {
                    GlossaryModel modelGlossary = GlossaryModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      isFavourite: false,
                    );
                    await GlossaryRepo()
                        .addFavourite(modelGlossary: modelGlossary);
                    titleController.clear();
                    descriptionController.clear();
                  }
                },
                child: Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
