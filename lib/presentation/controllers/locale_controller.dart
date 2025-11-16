import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_theme.dart';

class LocaleController extends GetxController {
  Rx<ThemeData> appTheme = darkTheme.obs;

  void changeTheme(ThemeData theme) {
    appTheme.value = theme;
    Get.changeTheme(theme);
  }

  void toggleTheme() {
    if (appTheme.value == lightTheme) {
      changeTheme(darkTheme);
    } else {
      changeTheme(lightTheme);
    }
  }
}
