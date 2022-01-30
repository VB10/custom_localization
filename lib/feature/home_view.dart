import 'package:flutter/material.dart';

import '../product/constants/locale_keys.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.hello.tr(context)),
      ),
      body: Column(
        children: [
          ListTile(title: Text(LocaleKeys.ageQuestion.tr(context))),
          ListTile(title: Text(LocaleKeys.name.tr(context)))
        ],
      ),
    );
  }
}
