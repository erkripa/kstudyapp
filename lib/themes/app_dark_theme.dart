import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color maintTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData get buildDarkTheme {
    ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: primaryColorDark,
      iconTheme: getIconTheme,
      textTheme: getTextTheme.apply(
        bodyColor: maintTextColorDark,
        displayColor: maintTextColorDark,
      ),
    );
  }
}
