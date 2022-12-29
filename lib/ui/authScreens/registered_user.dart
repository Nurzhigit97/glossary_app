import 'package:flutter/material.dart';

class RegisteredUser extends StatefulWidget {
  static String route = 'registeredUser';
  const RegisteredUser({Key? key}) : super(key: key);

  @override
  _RegisteredUserState createState() => _RegisteredUserState();
}

class _RegisteredUserState extends State<RegisteredUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Пользователь'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/auth/fakeUser.png'),
            ),
            Text(
              'pow@gmail.com',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '12345',
              style: TextStyle(fontSize: 20),
            ),
          ],
        )),
      ),
    );
  }
}
