import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/utils/app_colors.dart';

import '../../controllers/my_zoom_controller.dart';

class MenuPage extends GetView<MyZoomDrawerController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: UIParameters.defaultAllPadding,
      decoration: BoxDecoration(gradient: AppColors.mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.onSurfaceColor)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              right: 170,
              child: BackButton(
                onPressed: () => controller.toggleZoomDrawer(),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
