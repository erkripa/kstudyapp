import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/utils/dimensions.dart';

double _defaultPadding = Dx.defaultPadding; //16
double _defaultRadius = Dx.defaultPadding; //10
//getters
double get defaultPadding => _defaultPadding;
double get defaultRadius => _defaultRadius;

class UIParameters {
  //return edgeinsets
  static EdgeInsets get defaultAllPadding => EdgeInsets.all(_defaultPadding);

  static BorderRadius get defaultCircularRadius =>
      BorderRadius.circular(_defaultRadius); //10 radius all

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
