import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/controllers/auth_controller.dart';
import 'package:kstudyapp/themes/txt_style.dart';
import 'package:kstudyapp/utils/app_colors.dart';
import 'package:kstudyapp/utils/dimensions.dart';

import '../../widgets/main_button.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: UIParameters.defaultAllPadding,
        decoration: BoxDecoration(
          gradient: AppColors.mainGradient(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/images/app_splash_logo.png",
              height: 200,
              width: 200,
            ),
            Spacer(),
            Text(
                "Rather than declaring a font as part of an app, you can declare a font as part of a separate package. This is a convenient way to share the same font across several different projects, or for coders  ",
                style: loginInfoTextStyle.copyWith(
                  color: AppColors.onSurfaceColor,
                )),
            SizedBox(height: Dx.h40),
            MainButton(
              svgPath: 'assets/icons/google.svg',
              text: 'SignIn with Google',
              isEnabled: true,
              onTap: () => controller.signInWithGoogle(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
