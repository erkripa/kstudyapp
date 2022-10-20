import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/controllers/theme_controllers/theme_controller.dart';
import 'package:kstudyapp/themes/txt_style.dart';
import 'package:kstudyapp/utils/app_colors.dart';
import 'package:kstudyapp/utils/dimensions.dart';

import '../../controllers/my_zoom_controller.dart';

class MenuPage extends GetView<MyZoomDrawerController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: defaultPadding),
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
              top: 140,
              right: 100,
              child: CloseButton(
                onPressed: () => controller.toggleZoomDrawer(),
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Obx(() {
                  if (controller.user.value == null) {
                    return const SizedBox();
                  } else {
                    return Text(
                      "${controller.user.value?.displayName}",
                      style: headeTextStyle,
                    );
                  }
                }),
                const Spacer(),
                DrawerTileButton(
                  labelText: 'Email',
                  icon: Icons.email,
                  onTap: () => controller.email(),
                ),
                DrawerTileButton(
                  labelText: 'Facebook',
                  icon: Icons.facebook,
                  onTap: () {
                    // controller.facebook();
                    Get.changeTheme(Get.isDarkMode
                        ? Get.find<ThemeController>().lightTheme
                        : Get.find<ThemeController>().darkTheme);
                  },
                ),
                DrawerTileButton(
                  labelText: 'Website',
                  icon: Icons.web,
                  onTap: () => controller.website(),
                ),
                const Spacer(flex: 4),
                Padding(
                  padding: EdgeInsets.only(left: Dx.w30),
                  child: DrawerTileButton(
                    labelText: 'Logout',
                    icon: Icons.logout,
                    onTap: () => controller.signOut(),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTileButton extends StatelessWidget {
  const DrawerTileButton({
    super.key,
    this.onTap,
    this.labelText,
    this.icon,
  });

  final VoidCallback? onTap;
  final String? labelText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap ?? () {},
      icon: Icon(icon),
      label: Text(labelText!),
    );
  }
}
