// Package imports:

// Package imports:
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Project imports:
import '../utils/app_logger.dart';
import '../utils/constant.dart';
import 'service_interface.dart';

class SqlLiteService implements ServiceInterface {
  @override
  String get name => "SqlLite Service";

  late final String pathDB;
  late final Database database;

  @override
  Future<void> initializeService() async {
    var databasesPath = await getDatabasesPath();
    pathDB = join(databasesPath, kDBName);
    await openDB();
    AppLogger.logDebug('$name Success initialization');
  }

  Future<void> openDB() async {
    database = await openDatabase(kDBName);
  }

  Future<void> closeDB() async {
    await database.close();
  }

  Future<void> deleteDB() async {
    await deleteDatabase(kDBName);
  }

  // singleton
  SqlLiteService.init();
  static SqlLiteService? _instance;
  factory SqlLiteService() => _instance ??= SqlLiteService.init();
}
