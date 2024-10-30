import 'package:micit_test/src/core/services/sqlite_service.dart';
import 'package:micit_test/src/core/utils/app_logger.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/error/app_exception.dart';

class AppDatabase {
  late final Database _database;

  Future<List<int>> save(String table, List<Map<String, dynamic>> users) async {
    await createTableIfNotExists(table, users.first);
    List<int> result = [];
    try {
      await _database.transaction(
        (txn) async {
          for (var element in users) {
            final index = await txn.insert(table, element, conflictAlgorithm: ConflictAlgorithm.replace);
            result.add(index);
          }
        },
      );

      result;
    } catch (e) {
      result.clear();
      throw (AppException(e));
    }
    return result;
  }

  Future<int> update(String table, Map<String, dynamic> user) async {
    late int result;
    int? id = user['id'];
    try {
      result = await _database.update(table, user,
          where: 'id = ?', whereArgs: [id], conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      result = -1;
      throw (AppException(e));
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> get(String table, {int? id}) async {
    try {
      if (id != null) {
        final List<Map<String, dynamic>> result = await _database.query(table, where: 'id = ?', whereArgs: [id]);
        return result;
      }
      final List<Map<String, dynamic>> result = await _database.query(table);
      return result;
    } catch (e) {
      throw AppException(e);
    }
  }

  Future<int> remove(String table, int id) async {
    late int result;
    try {
      result = await _database.delete(table, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      result = -1;
      throw AppException(e);
    }
    return result;
  }

  Future<void> createTableIfNotExists(String tableName, Map<String, dynamic> data) async {
    // Check if the table exists
    final List<Map<String, dynamic>> tables = await _database.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );

    if (tables.isEmpty) {
      // Build the SQL create table statement dynamically based on the map
      StringBuffer createTableQuery = StringBuffer('CREATE TABLE $tableName (id INTEGER PRIMARY KEY');

      data.forEach((key, value) {
        if (key != 'id') {
          createTableQuery.write(', $key ${_getSQLiteType(value)}');
        }
      });

      createTableQuery.write(')');

      // Execute the create table query
      await _database.execute(createTableQuery.toString());
      AppLogger.logDebug('Table $tableName created successfully.');
    } else {
      AppLogger.logDebug('Table $tableName already exists.');
    }
  }

  String _getSQLiteType(dynamic value) {
    return switch (value) {
      int _ => SQLiteTypes.INTEGER.name,
      String _ => SQLiteTypes.TEXT.name,
      bool _ => SQLiteTypes.INTEGER.name,
      double _ => SQLiteTypes.REAL.name,
      null => SQLiteTypes.TEXT.name,
      _ => throw UnsupportedError('Unsupported type: ${value.runtimeType}'),
    };
  }

  // singleton
  AppDatabase.init() {
    _database = SqlLiteService().database;
  }
  static AppDatabase? _instance;
  factory AppDatabase() => _instance ??= AppDatabase.init();
}

enum SQLiteTypes {
  INTEGER,
  TEXT,
  REAL,
}
