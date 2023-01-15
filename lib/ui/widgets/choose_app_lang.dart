import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseAppLang extends StatefulWidget {
  const ChooseAppLang({Key? key}) : super(key: key);

  @override
  State<ChooseAppLang> createState() => _ChooseAppLangState();
}

class _ChooseAppLangState extends State<ChooseAppLang> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
        icon: Icon(
          Icons.language_rounded,
        ),
        onChanged: (locale) {
          context.setLocale(locale ?? context.locale);
        },
        underline: SizedBox.shrink(),
        alignment: Alignment.center,
        items: const [
          DropdownMenuItem(
            value: Locale('en'),
            child: Text(
              'EN',
            ),
          ),
          DropdownMenuItem(
            value: Locale('ky'),
            child: Text('KG'),
          ),
          DropdownMenuItem(
            value: Locale('ru'),
            child: Text('RU'),
          ),
        ],
        selectedItemBuilder: (context) {
          return [
            const Text(
              'EN',
            ),
            const Text(
              'KG',
            ),
            const Text(
              'RU',
            ),
          ];
        });
  }
}
