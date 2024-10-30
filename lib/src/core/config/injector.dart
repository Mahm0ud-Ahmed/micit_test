import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:get_it/get_it.dart';
import 'package:micit_test/src/core/services/sqlite_service.dart';
import 'package:micit_test/src/core/services/internet_service.dart';
import 'package:micit_test/src/core/services/storage_service.dart';
import 'package:micit_test/src/core/utils/theme_manager.dart';
import 'package:micit_test/src/data/local/app_database.dart';
import 'package:micit_test/src/data/repositories/api_repository_imp.dart';
import 'package:micit_test/src/data/repositories/local_repository_impl.dart';
import 'package:micit_test/src/domain/interfaces/i_local_repository.dart';
import 'package:micit_test/src/domain/interfaces/i_remote_repository.dart';

import '../../../firebase_options.dart';
import '../../data/remote/dio_api_service.dart';
import '../../presentation/view_model/blocs/assistance/my_bloc_observer.dart';
import '../services/dio_service.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  injector.registerSingleton<InternetService>(InternetService());
  await injector<InternetService>().initializeService();

  injector.registerSingleton<StorageService>(StorageService());
  await injector<StorageService>().initializeService();

  injector.registerSingleton<DioService>(DioService());
  await injector<DioService>().initializeService();

  injector.registerSingleton<SqlLiteService>(SqlLiteService());
  await injector<SqlLiteService>().initializeService();

  injector.registerSingleton<DioApiService>(DioApiService(dio: injector<DioService>().dio));

  injector.registerSingleton<AppDatabase>(AppDatabase());

  injector.registerSingleton<LocalAppRepository>(LocalRepositoryImpl(appDatabase: injector()));
  injector.registerSingleton<IRemoteRepository>(ApiRepositoryImp(dioApiService: injector()));

  injector.registerSingleton<ThemeManager>(ThemeManager());

  Bloc.observer = MyBlocObserver();
}
