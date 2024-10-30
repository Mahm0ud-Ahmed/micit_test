// Project imports:
import 'package:micit_test/src/data/models/user_model.dart';

import '../data/models/api_pagination_model.dart';

class ModelType {
  static dynamic getParseData<T>(Object? json) {
    if (json != null) {
      if (json is String || json is int || json is double || json is bool || json is List) {
        return json;
      } else if (json is Map<String, dynamic>) {
        var modelFactory = getModel<T>();
        if (modelFactory != null) {
          if (T == ApiPaginationModel<dynamic>) {
            return modelFactory.call(json, (json) => json);
          }
          return modelFactory.call(json);
        }
        return json;
      }
    }
    return null;
  }

  static Function? getModel<T>() {
    switch (T) {
      case const (ApiPaginationModel):
        return ApiPaginationModel.fromJson;
      case const (UserModel):
        return UserModel.fromJson;
      default:
        return null;
    }
  }
}
