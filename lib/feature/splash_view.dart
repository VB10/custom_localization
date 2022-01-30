import 'package:custom_localization/product/constants/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/src/provider.dart';

import '../product/manager/language_manager.dart';
import '../product/widget/language_dropdown.dart';
import 'home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String _welcome = 'Welcome Localization App';
  final String _lottiePath = 'https://assets2.lottiefiles.com/packages/lf20_rtfa0ici.json';

  @override
  void initState() {
    super.initState();
    context.read<LanguageManager>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.welcomeApp.tr(context)),
        actions: [
          IconButton(
              onPressed: () async {
                await context.read<LanguageManager>().clear();
                await context.read<LanguageManager>().init();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chevron_right),
        onPressed: () {
          context.navigateToPage(const HomeView());
        },
      ),
      body: Column(
        children: [
          Lottie.network(_lottiePath),
          ListTile(
            subtitle: const LanguageDropdown(),
            title: Text('Current language: ${context.watch<LanguageManager>().initialResources}'),
          )
        ],
      ),
    );
  }
}
