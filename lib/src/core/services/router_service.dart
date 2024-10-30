import 'package:flutter/material.dart' show BuildContext, MaterialPageRoute, Route, RouteSettings, Widget;
import 'package:micit_test/src/presentation/view/pages/home/home_page.dart';

import '../../presentation/view/pages/login/login_page.dart';
import '../../presentation/view/pages/splash/splash_page.dart';
import '../utils/app_logger.dart';
import '../utils/enums.dart';
import 'service_interface.dart';

class RouterService implements ServiceInterface {
  @override
  String get name => 'Router Service';

  @override
  Future<void> initializeService() async {
    AppLogger.logDebug('$name Success initialization');
  }

  static final routes = <String, Widget Function(BuildContext, {Object? arg})>{
    AppLocalRoute.splash.route: (BuildContext context, {Object? arg}) => const SplashPage(),
    AppLocalRoute.login.route: (BuildContext context, {Object? arg}) => const LoginPage(),
    AppLocalRoute.home.route: (BuildContext context, {Object? arg}) => const HomePage(),
  };

  var onGenerateRoute = (RouteSettings settings) {
    final String? name = settings.name;
    final Function(BuildContext, {Object? arg})? pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            settings: settings, builder: (context) => pageContentBuilder(context, arg: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(settings: settings, builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  };

  // Singleton
  RouterService._init();
  static RouterService? _instance;
  factory RouterService() => _instance ??= RouterService._init();
}
