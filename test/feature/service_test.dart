import 'package:custom_localization/feature/service/language_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILangugaeService langugaeService;
  setUp(() {
    langugaeService =
        LanguageService(NetworkManager(options: BaseOptions(baseUrl: 'https://fluttertr-ead5c.firebaseio.com/')));
  });
  test('Supported Language List', () async {
    final data = await langugaeService.fetchLangageList();
    expect(data, List<String>);
  });

  test('En Resources List', () async {
    final data = await langugaeService.fetchSpesificResources('en');
    expect(data, isNotEmpty);
  });

  test('Get Question key - FetchSpesificResources', () async {
    final data = await langugaeService.fetchSpesificResources('en');

    expect(data?['ageQuestion'], isNotEmpty);
  });
}
