import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kstudyapp/utils/app_colors.dart';
import 'package:kstudyapp/utils/dimensions.dart';

mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return IconThemeData(
      color: AppColors.onSurfaceColor,
      size: Get.height / 44.70,
    );
  }
}
