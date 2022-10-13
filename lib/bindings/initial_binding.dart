import 'package:get/get.dart';
import 'package:kstudyapp/controllers/auth_controller.dart';

import '../services/firebase_storage_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
