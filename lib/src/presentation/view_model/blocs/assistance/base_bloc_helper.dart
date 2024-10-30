import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:micit_test/src/domain/usecases/add_data_use_case.dart';
import 'package:micit_test/src/domain/usecases/get_all_data_use_case.dart';
import 'package:micit_test/src/domain/usecases/update_data_use_case.dart';
import 'package:micit_test/src/presentation/view_model/blocs/data_bloc/api_data_bloc.dart';

import '../../../../core/config/injector.dart';
import '../../../../core/utils/api_info.dart';
import '../../../../data/models/api_pagination_model.dart';
import '../../../../data/repositories/api_repository_imp.dart';
import '../../../../domain/interfaces/i_remote_repository.dart';
import '../../../../domain/usecases/delete_data_use_case.dart';

class BaseBlocHelper<MODEL> {
  final GetAllDataUseCase<MODEL> getAllDataUseCase = GetAllDataUseCase(injector(), injector());
  final AddDataUseCase<MODEL> addDataUseCase = AddDataUseCase(injector());
  final UpdateDataUseCase<MODEL> updateDataUseCase = UpdateDataUseCase(injector());
  final DeleteDataUseCase<MODEL> deleteDataUseCase = DeleteDataUseCase(injector());
  final ApiDataBloc<MODEL> cubit;

  IRemoteRepository? repository;
  PagingController<int, MODEL>? controller;
  ApiInfo? apiInfo;

  BaseBlocHelper({
    required this.cubit,
    this.repository,
    this.apiInfo,
  }) {
    repository = ApiRepositoryImp(dioApiService: injector());
    initQueries();
  }

  Map<String, dynamic>? initQueries({ApiInfo? pApiInfo}) {
    apiInfo ??= pApiInfo;
    if (apiInfo != null) {
      Map<String, dynamic> map = {
        'page': apiInfo?.page,
        'per_page': apiInfo?.pageSize,
      };
      if (apiInfo!.queries != null && apiInfo!.queries!.isNotEmpty) {
        apiInfo!.queries!.addAll(map);
      } else {
        apiInfo?.queries = map;
      }
      return apiInfo?.queries;
    }
    return null;
  }

  void initializeController() {
    controller = PagingController<int, MODEL>(
      firstPageKey: apiInfo?.queries?['page'],
      invisibleItemsThreshold: apiInfo?.queries?['per_page'],
    );
    controller?.removePageRequestListener(_fetchData);
    controller?.addPageRequestListener(_fetchData);
  }

  void _fetchData(int pageKey) {
    apiInfo?.queries?['page'] = pageKey;
    apiInfo?.page = pageKey;
    if (!cubit.isClosed) {
      cubit.getIndexData(info: apiInfo!);
    }
  }

  int? currentPage;

  void newSettingForPagination(ApiPaginationModel<MODEL> pagination) {
    apiInfo?.queries?['page']++;
    bool noMore = _noMoreData(pagination);
    if (noMore) {
      controller?.appendLastPage(pagination.data);
    } else {
      controller?.appendPage(pagination.data, apiInfo?.queries?['page']);
    }
  }

  bool _noMoreData(ApiPaginationModel<MODEL> pagination) {
    return pagination.page >= pagination.totalPages;
    // }
  }
}
