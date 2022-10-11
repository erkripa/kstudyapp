import 'dart:developer';
import 'package:get/get.dart';

import '../routes/navigations.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    log("onit");
    super.onInit();
  }

  @override
  void onReady() {
    initAuth();
    log("object");

    super.onReady();
  }

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroductionPage();
  }
}
