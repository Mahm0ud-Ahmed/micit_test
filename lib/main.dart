import 'package:flutter/material.dart';
import 'package:micit_test/src/core/utils/enums.dart';

import 'src/core/config/injector.dart';
import 'src/core/config/l10n/generated/l10n.dart';
import 'src/core/services/router_service.dart';
import 'src/core/utils/theme_manager.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: S.current.app_name,
      theme: ThemeManager.myTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        S.delegate,
        AppLocalizationDelegate(),
      ],
      initialRoute: AppLocalRoute.splash.route,
      onGenerateRoute: RouterService().onGenerateRoute,
    );
  }
}
