import 'package:get/get.dart';
import 'package:kstudyapp/routes/route_constant.dart';

void navigateToIntroductionPage() {
  Get.offAllNamed(AppRouteName.introductionPage);
}

void navigateToHomePage() {
  Get.offAllNamed(AppRouteName.homePage);
}

void navigateToLoginPage() {
  Get.toNamed(AppRouteName.loginPage);
}

void navigateToQuestionPage() {
  Get.toNamed(AppRouteName.questionsPage);
}
