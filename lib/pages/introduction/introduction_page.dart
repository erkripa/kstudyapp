import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/pages/home/home_page.dart';
import 'package:kstudyapp/routes/navigations.dart';
import 'package:kstudyapp/widgets/app_icon_widget.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIconWidget(
              icon: Icons.safety_check,
              onTap: () {},
              size: Dx.w10 * 5,
            ),
            SizedBox(height: Dx.h20),
            Container(
              padding: EdgeInsets.all(Dx.w10),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceColor,
                  fontSize: Dx.f18,
                ),
              ),
            ),
            SizedBox(height: Dx.h20),
            AppIconWidget(
              icon: Icons.arrow_forward,
              onTap: () => navigateToHomePage(),
              size: Dx.w10 * 5,
            ),
          ],
        ),
      ),
    );
  }
}
