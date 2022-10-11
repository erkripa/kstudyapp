import 'package:flutter/material.dart';
import 'package:get/get.dart';

const normalHeight = 805.3;

class Dx {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//Height 805.3 height
  static double h10 = screenHeight / 80.5;
  static double h15 = screenHeight / 53.7;
  static double h20 = screenHeight / 40.3;
  static double h25 = screenHeight / 32.2;
  static double h30 = screenHeight / 26.84;
  static double h45 = screenHeight / 17.9;
  static double h40 = screenHeight / 20.13;

  static double h220 = screenHeight / 3.7;

// width 384 screen width
  static double w10 = screenWidth / 38.4;
  static double w15 = screenWidth / 25.5;
  static double w20 = screenWidth / 19.2;
  static double w30 = screenWidth / 12.8;

//Font Size
  static double f16 = screenHeight / 50.33;
  static double f18 = screenHeight / 44.70;
  static double f21 = screenHeight / 38.34;
  static double f20 = screenHeight / 40.3;
  static double f12 = screenHeight / 67.1;
  static double f14 = screenHeight / 57.5;

//Radius
  static double r20 = screenHeight / 40.3;
  static double r15 = screenHeight / 53.7;
  static double r10 = screenHeight / 80.5;
  static double r30 = screenHeight / 26.8;

  static double expandableHeight = screenHeight / 5.3;

  //border radius
  static BorderRadius defaultBoderRadius = BorderRadius.circular(r10);
}
