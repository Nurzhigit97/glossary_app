import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glossary_app/generated/locale_keys.g.dart';

Text serverError(String state) {
  return Text(
    state.contains('Connecting timed out')
        ? LocaleKeys.serverError.tr()
        : LocaleKeys.serverErrorElse.tr(),
    style: TextStyle(fontSize: 20, color: Colors.red),
  );
}
