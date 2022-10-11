import 'package:flutter/material.dart';
import 'package:kstudyapp/utils/dimensions.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/app_splash_logo.png",
            height: Dx.h20 * 10,
            width: Dx.w20 * 10,
          ),
        ],
      ),
    );
  }
}
