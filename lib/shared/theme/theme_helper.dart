import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class ThemeHelper {
  final _key = "theme";

  ThemeMode themeMode() {
    final themeValue = prefs!.getInt(_key);
    if (themeValue == null) {
      return ThemeMode.system;
    } else {
      return ThemeMode.values[themeValue];
    }
  }

  void updateThemeMode(ThemeMode theme) {
    prefs!.setInt(_key, theme.index);
  }
}
