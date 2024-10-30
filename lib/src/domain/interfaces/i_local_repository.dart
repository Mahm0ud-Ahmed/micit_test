
abstract class LocalAppRepository {
  Future<List<int>> store(String table, List<Map<String, dynamic>> data);
  Future<List<Map<String, dynamic>>> get(String table, {int? id});
  Future<int> remove(String table, int id);
  Future<int> update(String table, Map<String, dynamic> data);
}
