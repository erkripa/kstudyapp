import 'dart:developer';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../core/firebase/references.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorageRef
          .child("question_paper_images")
          .child("${imgName.toLowerCase()}.png");
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      log("error ->$e");
      return null;
    }
  }
}
