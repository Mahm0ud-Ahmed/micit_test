// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../../core/error/error.dart';
import '../../../../core/utils/api_info.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../data/models/api_pagination_model.dart';
import '../assistance/base_bloc_helper.dart';
import 'api_data_state.dart';

class ApiDataBloc<MODEL> extends Cubit<ApiDataState<MODEL>> {
  BaseBlocHelper<MODEL>? _helper;
  PagingController<int, MODEL>? get controller => _helper?.controller;
  final ApiInfo? apiInfo;

  ApiDataBloc({this.apiInfo}) : super(const ApiDataIdle()) {
    _helper = BaseBlocHelper<MODEL>(cubit: this, apiInfo: apiInfo);
    if (apiInfo != null) {
      _helper?.initQueries(pApiInfo: apiInfo);
      _helper?.initializeController();
    }
  }

  Future<void> addData({required ApiInfo info, String? id}) async {
    emit(ApiDataLoading<MODEL>(id: id));
    return await _helper!.addDataUseCase.call(event: info).then((value) {
      value.when(
        success: (successState) {
          if (_helper!.controller != null) {
            final allData = _helper!.controller!.itemList!;
            allData.add(successState);
            _helper!.controller!.itemList = List.from(allData);
            emit(ApiDataSuccessModel(response: successState, id: id));
          }
        },
        failure: (errorState) {
          controller?.error = errorState;
          _emitError(errorState, id: id);
        },
      );
    });
  }

  Future<void> updateData({required ApiInfo info, required int index}) async {
    emit(ApiDataLoading<MODEL>(id: index.toString()));
    return await _helper!.updateDataUseCase.call(event: info).then((value) {
      value.when(
        success: (successState) {
          if (_helper!.controller != null) {
            final allData = _helper!.controller!.itemList!;
            allData[index] = successState;
            _helper!.controller!.itemList = List.from(allData);

            emit(ApiDataSuccessModel(response: successState, id: index.toString()));
          }
        },
        failure: (errorState) {
          controller?.error = errorState;
          _emitError(errorState, id: index.toString());
        },
      );
    });
  }

  Future<void> deleteData({required ApiInfo info, required int index}) async {
    emit(ApiDataLoading<MODEL>(id: index.toString()));
    return await _helper!.deleteDataUseCase.call(event: info).then((value) {
      value.when(
        success: (successState) {
          if (_helper!.controller != null) {
            final allData = _helper!.controller!.itemList;
            if (allData != null) {
              allData.removeAt(index);
            }
            _helper!.controller!.itemList = List.from(allData ?? []);
            emit(ApiDataSuccessModel(response: null, id: index.toString()));
          }
        },
        failure: (errorState) {
          controller?.error = errorState;
          _emitError(errorState, id: index.toString());
        },
      );
    });
  }

  Future<void> getIndexData({required ApiInfo info}) async {
    _helper?.initQueries(pApiInfo: info);

    emit(ApiDataLoading<MODEL>());
    final DataState<ApiPaginationModel<MODEL>> dataState = await _helper!.getAllDataUseCase.call(event: info);
    dataState.when(
      success: (successState) {
        if (_helper!.controller != null) {
          _helper!.newSettingForPagination(successState);
          final data = _helper!.controller!.itemList?.toSet().toList();
          _helper!.controller!.itemList = data;
        }
      },
      failure: (errorState) {
        controller?.error = errorState;
        _emitError(errorState);
      },
    );
    emit(ApiDataIdle<MODEL>());
  }

  void _emitError(AppError errorState, {String? id}) {
    emit(ApiDataError<MODEL>(error: errorState, id: id));
  }

  @override
  Future<void> close() {
    _helper!.controller?.dispose();
    _helper!.repository = null;
    _helper = null;
    return super.close();
  }
}
