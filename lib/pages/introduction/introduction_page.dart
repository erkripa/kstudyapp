import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/pages/home/home_page.dart';
import 'package:kstudyapp/routes/navigations.dart';
import 'package:kstudyapp/widgets/app_icon.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.mainGradient(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIcon(
              icon: Icons.safety_check,
              onTap: () {},
              width: Dx.w10 * 5,
              color: Colors.yellow,
            ),
            SizedBox(height: Dx.h20),
            Container(
              padding: EdgeInsets.all(Dx.w10),
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              ),
            ),
            SizedBox(height: Dx.h20),
            AppIcon(
              icon: Icons.arrow_forward,
              onTap: () => navigateToHomePage(),
              width: Dx.w10 * 5,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
