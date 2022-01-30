import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/language_manager.dart';

enum LocaleKeys { hello, name, ageQuestion, welcomeApp }

extension LocaleKeysExtension on LocaleKeys {
  String tr(BuildContext context) {
    return context.watch<LanguageManager>().resources?[name] ?? '';
  }
}
