import 'package:get/get.dart';
import 'package:kstudyapp/controllers/auth_controller.dart';
import 'package:kstudyapp/controllers/theme_controllers/theme_controller.dart';

import '../services/firebase_storage_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
