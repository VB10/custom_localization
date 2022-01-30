import 'package:hive_flutter/hive_flutter.dart';

abstract class IHive<T> {
  Future<void> init();
  Future<void> addValues(T resources);
  Future<void> updateValues(T resources);
  String? getValue(String key);
  T? getValues();
  Future<void> clear();
}

class LanguageHive extends IHive<Map<String, String>> {
  final String _key = 'lang';
  late Box<String> _langaugeBox;

  @override
  Future<void> init() async {
    _langaugeBox = await Hive.openBox(_key);
  }

  @override
  Future<void> addValues(Map<String, String> resources) async {
    await _langaugeBox.putAll(resources);
  }

  @override
  Future<void> updateValues(Map<String, String> resources) async {
    await _langaugeBox.clear();
    await _langaugeBox.putAll(resources);
  }

  @override
  String? getValue(String key) {
    return _langaugeBox.get(key);
  }

  @override
  Map<String, String>? getValues() {
    return _langaugeBox.toMap().cast<String, String>();
  }

  @override
  Future<void> clear() async {
    await _langaugeBox.clear();
  }
}
