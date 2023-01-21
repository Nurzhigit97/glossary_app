import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';
import 'package:glossary_app/ui/auth_screens/sign_in.dart';

import '../../data/repositories/user_secure_storage.dart';

class RegisteredDialog extends StatefulWidget {
  static String route = 'registeredDialog';
  String? name;
  String? email;
  RegisteredDialog({Key? key, this.name, this.email}) : super(key: key);

  @override
  State<RegisteredDialog> createState() => _RegisteredDialogState();
}

class _RegisteredDialogState extends State<RegisteredDialog> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final name = await UserSecureStorage.getUserName() ?? '';
    final email = await UserSecureStorage.getUserEmail() ?? '';
    setState(() {
      widget.name = name;
      widget.name = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Получаем текущий пользователь
    User? user = FirebaseAuth.instance.currentUser;
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          content: Container(
            constraints: BoxConstraints(maxHeight: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Если не авторизован показываем текст "Пройти авторизацию" иначе данные user
                user == null
                    ? Text(
                        LocaleKeys.signIn.tr(),
                        style: TextStyle(fontSize: 20),
                      )
                    : Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                '${user.photoURL ?? 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'}'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('${user.displayName ?? ''}'),
                          Text('${user.email}'),
                        ],
                      )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                LocaleKeys.login.tr(),
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              onPressed: () async {
                await Navigator.of(context).pushReplacementNamed(SignIn.route);
              },
            ),
          ],
        ),
      ),
      icon: Icon(Icons.person),
    );
  }
}
