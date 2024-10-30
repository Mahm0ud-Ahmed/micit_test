import 'package:micit_test/src/data/local/app_database.dart';
import 'package:micit_test/src/domain/interfaces/i_local_repository.dart';

import '../../core/error/app_exception.dart';

class LocalRepositoryImpl implements LocalAppRepository {
  final AppDatabase appDatabase;

  LocalRepositoryImpl({required this.appDatabase});

  @override
  Future<List<Map<String, dynamic>>> get(String table, {int? id}) async {
    try {
      final result = await appDatabase.get(table, id: id);
      return result;
    } catch (error) {
      throw (AppException(error));
    }
  }

  @override
  Future<List<int>> store(String table, List<Map<String, dynamic>> data) async {
    try {
      final result = await appDatabase.save(table, data);
      return result;
    } catch (error) {
      final appException = AppException(error);
      throw appException;
    }
  }

  @override
  Future<int> remove(String table, int id) async {
    try {
      final result = await appDatabase.remove(table, id);
      return result;
    } catch (error) {
      final appException = AppException(error);
      throw appException;
    }
  }

  @override
  Future<int> update(String table, Map<String, dynamic> data) async {
    try {
      final result = await appDatabase.update(table, data);
      return result;
    } catch (error) {
      throw (AppException(error));
    }
  }
}
