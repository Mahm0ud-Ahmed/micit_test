// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../../core/error/error.dart';

part 'api_data_state.freezed.dart';

@freezed
class ApiDataState<T> with _$ApiDataState<T> {
  const factory ApiDataState.idle({String? id}) = ApiDataIdle;

  const factory ApiDataState.loading({String? id}) = ApiDataLoading;

  const factory ApiDataState.success({T? data, required T? response, String? id}) = ApiDataSuccessModel<T>;

  const factory ApiDataState.error({required AppError? error, String? id}) = ApiDataError<T>;
}
