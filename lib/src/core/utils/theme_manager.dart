// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/l10n/generated/l10n.dart';
import 'constant.dart';

class ThemeManager {
  static late ThemeData _themeData;

  void _setThemeData() {
    _themeData = ThemeData(
      scaffoldBackgroundColor: kMainColor,
      textTheme: _initTextStyle,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: kSecondaryColor,
        brightness: Brightness.light,
        primary: kTextSubColor,
        surfaceTint: kTextSubColor,
      ),
    );
  }

  void setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void defaultOrientationMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  TextTheme get _initTextStyle {
    return const TextTheme(
      headlineSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 26,
        overflow: TextOverflow.visible,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 32,
        overflow: TextOverflow.visible,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 17,
        overflow: TextOverflow.visible,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        overflow: TextOverflow.visible,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 19,
        overflow: TextOverflow.visible,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        overflow: TextOverflow.visible,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static ThemeData get myTheme => _themeData;

  static ThemeManager? _instance;
  ThemeManager._init() {
    _setThemeData();
    S.load(const Locale('en'));
  }
  factory ThemeManager() => _instance ??= ThemeManager._init();
}
