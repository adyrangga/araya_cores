import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArayaPrefs {
  static late SharedPreferences prefs;

  /// please initialize SharedPreferences on runApp function
  static Future<SharedPreferences> instance() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  /// get current themeMode value
  /// 0: ThemeMode.system. 1: ThemeMode.light. 2: ThemeMode.dark
  static int get getThemeMode => prefs.getInt(ArayaPrefsKeys.appTheme) ?? 1;

  /// set selected themeMode value
  static Future<bool> setThemeMode(ThemeMode themeMode) {
    int themeModeCode = 1;
    if (themeMode == ThemeMode.system) themeModeCode = 0;
    if (themeMode == ThemeMode.dark) themeModeCode = 2;
    return prefs.setInt(ArayaPrefsKeys.appTheme, themeModeCode);
  }

  /// get boolean value by prefs key
  static bool getBool(String appPrefsKeys) {
    return prefs.getBool(appPrefsKeys) ?? false;
  }

  /// set boolean value by prefs key
  static Future<bool> setBool(String appPrefsKeys, bool value) {
    return prefs.setBool(appPrefsKeys, value);
  }

  /// get String value by prefs key
  static String? getString(String appPrefsKeys) {
    return prefs.getString(appPrefsKeys);
  }

  /// set String value by prefs key
  static Future<bool> setString(String appPrefsKeys, String value) {
    return prefs.setString(appPrefsKeys, value);
  }

  /// get int value by prefs key
  static int? getInt(String appPrefsKeys) {
    return prefs.getInt(appPrefsKeys);
  }

  /// set int value by prefs key
  static Future<bool> setInt(String appPrefsKeys, int value) {
    return prefs.setInt(appPrefsKeys, value);
  }

  /// get double value by prefs key
  static double? getDouble(String appPrefsKeys) {
    return prefs.getDouble(appPrefsKeys);
  }

  /// set double value by prefs key
  static Future<bool> setDouble(String appPrefsKeys, double value) {
    return prefs.setDouble(appPrefsKeys, value);
  }
}

class ArayaPrefsKeys {
  static const appTheme = 'themeMode';
}
