// Package imports:
import 'dart:developer';

import 'package:micit_test/src/core/utils/api_info.dart';

import '../../core/error/app_exception.dart';
import '../../core/error/error.dart';
import '../../core/utils/data_state.dart';
import '../interfaces/i_local_repository.dart';
import '../usecase.dart';

// Project imports:

class DeleteDataUseCase<T> extends UseCase<Future<DataState<void>>, ApiInfo> {
  final LocalAppRepository _localRepository;

  DeleteDataUseCase(this._localRepository);

  @override
  Future<DataState<void>> call({required ApiInfo event}) async {
    String t = event.endpoint.replaceAll('/', '');
    try {
      final dataIndex = await _localRepository.remove(t, event.data!['id']);

      if (dataIndex > 0) {
        return const DataState.success(null);
      }

      return const DataState.failure(AppError(statusMessage: 'Delete failed'));
    } on AppException catch (error, s) {
      log('Stack Trace  ', stackTrace: s);
      return DataState.failure(AppException(error).handleError);
    } catch (error, s) {
      log('Stack Trace  ', stackTrace: s);
      return DataState.failure(AppException(error).handleError);
    }
  }
}
