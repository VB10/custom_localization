import 'package:vexana/vexana.dart';

class ProductNetworkManager extends NetworkManager {
  static const String _baseUrl = 'https://fluttertr-ead5c.firebaseio.com/';

  ProductNetworkManager() : super(options: BaseOptions(baseUrl: _baseUrl));
}
