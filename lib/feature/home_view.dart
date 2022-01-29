import 'package:custom_localization/feature/service/language_service.dart';
import 'package:custom_localization/product/languages.dart';
import 'package:custom_localization/product/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ILangugaeService _langugaeService;
  final String _baseUrl = 'https://fluttertr-ead5c.firebaseio.com/';

  Map<String, dynamic>? resources;
  Languages _initalLanguage = Languages.en;

  Future<void> _fetchResources(Languages languages) async {
    final _response = await _langugaeService.fetchSpesificResources(languages.name);
    if (_response?.isNotEmpty ?? false) {
      setState(() {
        resources = _response;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _langugaeService = LanguageService(NetworkManager(options: BaseOptions(baseUrl: _baseUrl)));
    _fetchResources(_initalLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resources?[LocaleKeys.hello.name] ?? ''),
        leading: _dropdownSelected(),
      ),
      body: Column(
        children: [
          ListTile(title: Text(resources?[LocaleKeys.ageQuestion.name] ?? '')),
          ListTile(title: Text(resources?[LocaleKeys.name.name] ?? ''))
        ],
      ),
    );
  }

  DropdownButton<Languages> _dropdownSelected() {
    return DropdownButton<Languages>(
      isExpanded: false,
      value: Languages.en,
      items: Languages.values
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ))
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        _fetchResources(value);
      },
    );
  }
}
