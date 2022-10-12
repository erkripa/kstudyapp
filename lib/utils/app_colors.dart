import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/themes/app_dark_theme.dart';
import 'package:kstudyapp/themes/app_light_theme.dart';

class AppColors {
  static LinearGradient mainGradientLight = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight],
  );
  static LinearGradient mainGradientDark = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark],
  );

  static LinearGradient mainGradient(BuildContext context) =>
      UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
}
