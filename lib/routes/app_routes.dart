import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:kstudyapp/controllers/question_paper_controller/question_paper_controller.dart';
import 'package:kstudyapp/pages/home/home_page.dart';
import 'package:kstudyapp/pages/introduction/introduction_page.dart';
import 'package:kstudyapp/pages/splash/splash_page.dart';
import 'package:kstudyapp/routes/route_constant.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: AppRouteName.splashPage,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: AppRouteName.introductionPage,
          page: () => const IntroductionPage(),
        ),
        GetPage(
            name: AppRouteName.homePage,
            page: () => const HomePage(),
            binding: BindingsBuilder(
              () {
                Get.put(QuestionPaperController());
              },
            )),
      ];
}
