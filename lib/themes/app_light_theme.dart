import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/sub_theme_data_mixin.dart';

// const Color primaryLightColorLight = Color(0xFF3ac3cb);
// const Color primaryColorLight = Color(0xFFf85187);

Color primaryLightColorLight = const Color(0xFF0085FF).withOpacity(0.5);
const Color primaryColorLight = Color(0xFF0085FF);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color(0xFFFFFFFF);

class LightTheme with SubThemeData {
  ThemeData buildlightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        cardColor: cardColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
          bodyColor: mainTextColorLight,
          displayColor: mainTextColorLight,
        ),
        drawerTheme: DrawerThemeData(
            scrimColor: Colors.black, backgroundColor: Colors.pink));
  }
}
