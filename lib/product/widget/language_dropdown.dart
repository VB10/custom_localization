import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../manager/language_manager.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
      isDense: false,
      value: context.watch<LanguageManager>().initialResources,
      items: context
          .watch<LanguageManager>()
          .initialLanguages
          ?.map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        context.read<LanguageManager>().changeLanguage(value);
      },
    );
  }
}
