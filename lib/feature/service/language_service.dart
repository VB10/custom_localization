import 'package:vexana/vexana.dart';

abstract class ILanguageService {
  final INetworkManager networkManager;

  ILanguageService(this.networkManager);

  Future<List<String>?> fetchLanguageList();
  Future<Map<String, String>?> fetchSpesificResources(String key);
}

class LanguageService extends ILanguageService {
  LanguageService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<String>?> fetchLanguageList() async {
    final response = await networkManager.sendPrimitive<List<dynamic>?>('/languages/list.json');

    return (response?.isNotEmpty ?? false) ? response?.cast<String>() : [];
  }

  @override
  Future<Map<String, String>?> fetchSpesificResources(String key) async {
    final response = await networkManager.sendPrimitive('/languages/$key.json');
    if (response is Map) {
      return response.cast<String, String>();
    }
  }
}
