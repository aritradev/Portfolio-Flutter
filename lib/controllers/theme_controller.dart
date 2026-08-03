import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controls theme mode. Defaults to system-adaptive,
/// but the user can toggle manually (animated toggle lives in header).
class ThemeController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  bool isDark(BuildContext context) {
    if (themeMode.value == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    }
    return themeMode.value == ThemeMode.dark;
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
    Get.changeThemeMode(themeMode.value);
  }
}
