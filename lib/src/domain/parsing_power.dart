import '../data/models/api_pagination_model.dart';
import 'model_type.dart';

ApiPaginationModel<Map<String, dynamic>> parsingData<T>(ApiPaginationModel args) {
  final result = args.data.map<Map<String, dynamic>>((json) => parseModel<Map<String, dynamic>>(json)).toList();
  return args.copyWithChangeType<Map<String, dynamic>>(data: result);
}

T parseModel<T>(dynamic json) => ModelType.getParseData<T>(json);
