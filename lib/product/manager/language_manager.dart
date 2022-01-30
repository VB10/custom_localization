import 'package:custom_localization/product/constants/languages.dart';
import 'package:custom_localization/product/constants/locale_keys.dart';
import 'package:flutter/cupertino.dart';

import '../../feature/service/language_service.dart';
import '../cache/language_hive.dart';

class LanguageManager extends ChangeNotifier with ILanguageManager {
  final ILanguageService languageService;
  final IHive<Map<String, String>> languageHive;
  final IHive<List<String>> languageListHive;

  LanguageManager(this.languageService, this.languageHive, this.languageListHive);
  Map<String, String>? resources;
  String? initialResources;
  List<String>? initialLanguages;

  @override
  Future<void> changeLanguage(String language) async {
    if (language == initialResources) {
      return;
    }

    final response = await languageService.fetchSpesificResources(language);
    resources = response;
    resources?[Languages.selected.name] = language;
    initialResources = language;
    await languageHive.updateValues(resources ?? {});
    notifyListeners();
  }

  Future<void> fetchLanguageList() async {
    if (languageListHive.getValues()?.isNotEmpty ?? false) {
      initialLanguages = languageListHive.getValues();
    } else {
      initialLanguages = await languageService.fetchLanguageList();
      await languageListHive.addValues(initialLanguages ?? []);
    }
  }

  @override
  Future<void> init() async {
    await Future.wait([languageHive.init(), languageListHive.init()]);
    await Future.wait([fetchLanguageList(), fetchInitialResponse()]);
  }

  Future<void> fetchInitialResponse() async {
    initialResources = languageHive.getValue(Languages.selected.name);
    if (initialResources?.isNotEmpty ?? false) {
      resources = languageHive.getValues();
      notifyListeners();
    } else {
      await changeLanguage(initialResources ?? Languages.en.name);
    }
  }

  @override
  Future<void> clear() async {
    await Future.wait([languageHive.clear(), languageListHive.clear()]);
  }
}

abstract class ILanguageManager {
  void changeLanguage(String language);
  Future<void> init();
  Future<void> clear();
}
