// Package imports:
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/error/app_exception.dart';
import '../../core/utils/api_info.dart';

class DioApiService {
  final Dio dio;
  DioApiService({
    required this.dio,
  });

  Future<Response> action({
    required ApiInfo query,
  }) async {
    return await _getData(query: query);
  }

  Future<Response> _getData({
    required ApiInfo query,
  }) async {
    try {
      final response = await dio.get(
        query.endpoint,
        queryParameters: query.queries,
      );
      if (response.statusCode == HttpStatus.ok) {
        return response;
      }
      throw (AppException(response.data));
    } catch (error) {
      throw (AppException(error));
    }
  }
}
