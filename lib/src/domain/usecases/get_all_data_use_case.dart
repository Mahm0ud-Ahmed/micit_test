// Package imports:
import 'dart:developer';

import 'package:micit_test/src/core/services/internet_service.dart';
import 'package:micit_test/src/core/utils/api_info.dart';
import 'package:micit_test/src/core/utils/app_logger.dart';
import 'package:micit_test/src/data/models/api_pagination_model.dart';
import 'package:micit_test/src/domain/parsing_power.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/error/app_exception.dart';
import '../../core/utils/data_state.dart';
import '../interfaces/i_local_repository.dart';
import '../interfaces/i_remote_repository.dart';
import '../usecase.dart';

class GetAllDataUseCase<T> extends UseCase<Future<DataState<ApiPaginationModel<T>>>, ApiInfo> {
  final IRemoteRepository _apiRepository;
  final LocalAppRepository _localRepository;

  GetAllDataUseCase(this._apiRepository, this._localRepository);

  @override
  Future<DataState<ApiPaginationModel<T>>> call({required ApiInfo event}) async {
    ApiPaginationModel? paginationModel;
    try {
      if (InternetService().hasInternet) {
        paginationModel = await _fetchAndStoreData(event);
        return await _storeDataIntoDb(event, paginationModel);
      } else {
        return await _fetchLocalData(event);
      }
    } on AppException catch (error, s) {
      log('Stack Trace  ', stackTrace: s);
      if (paginationModel != null && paginationModel.data.isNotEmpty) {
        final usersServer = paginationModel.data.map((e) => parseModel<T>(e)).toList();
        return DataState.success(paginationModel.copyWithChangeType<T>(data: usersServer));
      }
      else if (error.error.error is! DatabaseException) {
        try {
          return await _fetchLocalData(event);
        } catch (cacheError, cacheStack) {
          log('Cache fetch failed', stackTrace: cacheStack);
          return DataState.failure(AppException(error).handleError);
        }
      }
      return DataState.failure(AppException(error).handleError);
    } catch (error, s) {
      log('Stack Trace  ', stackTrace: s);
      return DataState.failure(AppException(error).handleError);
    }
  }

  Future<ApiPaginationModel> _fetchAndStoreData(ApiInfo event) async {
    final response = await _apiRepository.getPaginateData(event);
    return parseModel<ApiPaginationModel>(response);
  }

  Future<DataState<ApiPaginationModel<T>>> _storeDataIntoDb(ApiInfo event, ApiPaginationModel paginationModel) async {
    final dataMap = paginationModel.data.map<Map<String, dynamic>>((e) => e).toList();
    if (paginationModel.data.isNotEmpty) {
      await _localRepository.store(event.endpoint.replaceAll('/', ''), dataMap);
    }
    return await _mergeData(event, paginationModel.copyWithChangeType(data: dataMap));
  }

  Future<DataState<ApiPaginationModel<T>>> _fetchLocalData(ApiInfo event) async {
    final localData = await _localRepository.get(event.endpoint.replaceAll('/', ''));
    if (localData.isEmpty) {
      throw AppException('No cached data available');
    }
    final usersLocal = localData.map((e) => parseModel<T>(e)).toList();
    return DataState.success(
      ApiPaginationModel(
        total: usersLocal.length,
        totalPages: 2,
        page: event.page!,
        data: usersLocal,
      ),
    );
  }

  Future<DataState<ApiPaginationModel<T>>> _mergeData(
      ApiInfo event, ApiPaginationModel<Map<String, dynamic>> paginationModel) async {
    final localData = await _localRepository.get(event.endpoint.replaceAll('/', ''));
    if (localData.isEmpty) {
      final userList = paginationModel.data.map((e) => parseModel<T>(e)).toList();
      return DataState.success(paginationModel.copyWithChangeType<T>(data: userList));
    } else {
      final usersServer = paginationModel.data.map((e) => parseModel<T>(e)).toList();
      final usersLocal = localData.map((e) => parseModel<T>(e)).toList();
      AppLogger.logInfo('===>>> ${usersLocal.length}');
      usersLocal.addAll(usersServer);
      return DataState.success(paginationModel.copyWithChangeType<T>(data: <T>{...usersLocal}.toList()));
    }
  }
}
