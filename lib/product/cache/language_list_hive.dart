import 'package:hive_flutter/adapters.dart';

import 'language_hive.dart';

class LanguageListHive extends IHive<List<String>> {
  final String _key = 'langList';
  late Box<String> _langaugeBox;

  @override
  Future<void> init() async {
    _langaugeBox = await Hive.openBox(_key);
  }

  @override
  Future<void> addValues(List<String> resources) async {
    await _langaugeBox.addAll(resources);
  }

  @override
  Future<void> updateValues(List<String> resources) async {
    await _langaugeBox.clear();
    await _langaugeBox.addAll(resources);
  }

  @override
  String? getValue(String key) {
    return _langaugeBox.get(key);
  }

  @override
  List<String>? getValues() {
    return _langaugeBox.values.toList();
  }

  @override
  Future<void> clear() async {
    await _langaugeBox.clear();
  }
}
