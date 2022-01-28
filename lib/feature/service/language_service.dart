import 'package:vexana/vexana.dart';

abstract class ILangugaeService {
  final INetworkManager networkManager;

  ILangugaeService(this.networkManager);

  Future<List<String>?> fetchLangageList();
  Future<Map<String, dynamic>?> fetchSpesificResources(String key);
}

class LanguageService extends ILangugaeService {
  LanguageService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<String>?> fetchLangageList() async {
    final response = await networkManager.sendPrimitive<List<dynamic>>('/languages/list.json');

    return response is List<String> ? response : [];
  }

  @override
  Future<Map<String, dynamic>?> fetchSpesificResources(String key) async {
    final response = await networkManager.sendPrimitive('/languages/$key.json');

    return response;
  }
}
