// Package imports:
import 'dart:developer';

import 'package:micit_test/src/core/error/error.dart';
import 'package:micit_test/src/core/utils/api_info.dart';
import 'package:micit_test/src/domain/parsing_power.dart';

import '../../core/error/app_exception.dart';
import '../../core/utils/data_state.dart';
import '../interfaces/i_local_repository.dart';
import '../usecase.dart';

// Project imports:

class UpdateDataUseCase<T> extends UseCase<Future<DataState<T>>, ApiInfo> {
  final LocalAppRepository _localRepository;

  UpdateDataUseCase(this._localRepository);

  @override
  Future<DataState<T>> call({required ApiInfo event}) async {
    String t = event.endpoint.replaceAll('/', '');
    try {
      final dataIndex = await _localRepository.update(t, event.data!);

      if (dataIndex > 0) {
        final data = await _localRepository.get(t, id: event.data!['id']);
        return DataState.success(parseModel<T>(data.first));
      }
      return DataState.failure(const AppError(statusMessage: 'Update failed'));
    } on AppException catch (error, s) {
      log('Stack Trace  ', stackTrace: s);
      return DataState.failure(AppException(error).handleError);
    } catch (error, s) {
      log('Stack Trace  ', stackTrace: s);
      return DataState.failure(AppException(error).handleError);
    }
  }
}
