import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'feature/service/language_service.dart';
import 'feature/splash_view.dart';
import 'product/cache/language_hive.dart';
import 'product/cache/language_list_hive.dart';
import 'product/manager/language_manager.dart';
import 'product/manager/product_network_manager.dart';

Future<void> main() async {
  await Hive.initFlutter();

  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          LanguageManager(LanguageService(ProductNetworkManager()), LanguageHive(), LanguageListHive()),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SplashView(),
    );
  }
}
