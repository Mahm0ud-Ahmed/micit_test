// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import '../../core/error/app_exception.dart';
import '../remote/dio_api_service.dart';
import '../../domain/interfaces/i_remote_repository.dart';

class ApiRepositoryImp extends IRemoteRepository {
  final DioApiService dioApiService;
  ApiRepositoryImp({
    required this.dioApiService,
  });

  @override
  Future<Map<String, dynamic>> getPaginateData(apiInfo) async {
    try {
      final response = await dioApiService.action(query: apiInfo);
      if(response.statusCode == HttpStatus.ok) {
        return response.data;
      }
      throw AppException(response.data);
    } catch (error) {
      throw AppException(error);
    }
  }
}
