import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/themes/app_dark_theme.dart';
import 'package:kstudyapp/themes/app_light_theme.dart';

class AppColors {
  static LinearGradient mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight],
  );
  static LinearGradient mainGradientDark = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark],
  );

  static LinearGradient mainGradient() =>
      UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

  static const onSurfaceColor = Color(0xFFFFFFFF);

  static customScafoldColor(BuildContext context) => UIParameters.isDarkMode()
      ? const Color(0xFF2e3c62)
      : const Color.fromARGB(255, 240, 237, 255);
}
