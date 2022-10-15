import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/themes/app_dark_theme.dart';
import 'package:kstudyapp/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  //getters
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  @override
  void onInit() {
    intializeThemeData();
    super.onInit();
  }

  void intializeThemeData() {
    _lightTheme = LightTheme().buildlightTheme();
    _darkTheme = DarkTheme().buildDarkTheme();
  }
}
