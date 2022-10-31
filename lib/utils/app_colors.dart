import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  static LinearGradient mainGradient(BuildContext context) =>
      UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;

  static const onSurfaceColor = Color(0xFFFFFFFF);

  static customScafoldColor(BuildContext context) =>
      UIParameters.isDarkMode(context)
          ? const Color(0xFF2e3c62)
          : const Color.fromARGB(255, 240, 237, 255);

  static answerSelectedColor(BuildContext context) =>
      UIParameters.isDarkMode(context)
          ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
          : Theme.of(Get.context!).primaryColor;
  static answerBorderColor(BuildContext context) =>
      UIParameters.isDarkMode(context)
          ? const Color.fromARGB(255, 20, 46, 158)
          : const Color.fromARGB(255, 221, 221, 221);
}
