import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/shared/theme/theme_helper.dart';

class Controller extends GetxController {
  List<int> counters = [];

  void incrementCount({required int btnNum}) {
    counters[btnNum]++;
    update();
  }

  void decrementCount({required int btnNum}) {
    counters[btnNum]--;
    update();
  }

  ThemeMode theme = ThemeHelper().themeMode();
  void setTheme() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
    } else {
      theme = ThemeMode.dark;
    }
    ThemeHelper().updateThemeMode(theme);
    update();
  }
}
