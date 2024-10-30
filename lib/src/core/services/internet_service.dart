import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/app_logger.dart';
import 'service_interface.dart';

class InternetService implements ServiceInterface {
  @override
  String get name => "Internet Service";

  late final InternetConnectionChecker connectionChecker;

  late bool hasInternet;

  @override
  Future<void> initializeService() async {
    connectionChecker = InternetConnectionChecker();

    connectionChecker.onStatusChange.asBroadcastStream().listen(
      (event) {
        hasInternet = event == InternetConnectionStatus.connected ? true : false;
        AppLogger.logDebug('Internet Connection Status: $event');
      },
    );
    AppLogger.logDebug('$name Success initialization');
  }

  // singleton
  InternetService.init();
  static InternetService? _instance;
  factory InternetService() => _instance ??= InternetService.init();
}
