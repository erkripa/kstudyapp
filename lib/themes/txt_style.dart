import 'package:flutter/material.dart';

import '../configs/ui_parameters.dart';
import '../utils/dimensions.dart';

//1
TextStyle questionPaperCardTitleStyle(BuildContext context) {
  return TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dx.f18,
  );
}

//2
TextStyle get questionPaperCardDescStyle {
  return TextStyle(fontSize: Dx.f14);
}

//3
TextStyle questionAndTimeTextstyle(BuildContext context) {
  return TextStyle(
    fontSize: Dx.f12,
    color: UIParameters.isDarkMode()
        ? Colors.white
        : Theme.of(context).primaryColor,
  );
}

//4
TextStyle get headeTextStyle {
  return TextStyle(
    fontSize: Dx.f12 * 2,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
}

//5
TextStyle get loginInfoTextStyle {
  return TextStyle(
    fontSize: Dx.f18,
    fontWeight: FontWeight.w700,
  );
}

//6
TextStyle get questionTextStyle {
  return TextStyle(
    fontSize: Dx.f16,
    fontWeight: FontWeight.w800,
  );
}
