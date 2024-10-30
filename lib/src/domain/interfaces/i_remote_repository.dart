import 'package:micit_test/src/core/utils/api_info.dart';

abstract class IRemoteRepository {
  Future<Map<String, dynamic>> getPaginateData(ApiInfo apiInfo);
}
