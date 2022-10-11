import 'package:get/route_manager.dart';
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
      ];
}
