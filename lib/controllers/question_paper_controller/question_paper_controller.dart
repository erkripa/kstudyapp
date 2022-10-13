import 'dart:developer';

import 'package:kstudyapp/services/firebase_storage_services.dart';

import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPappers = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> paperNameList = ["biology", "chemistry", "maths", "physics"];
    try {
      for (var paper in paperNameList) {
        final paperImgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper);
        allPappers.add(paperImgUrl!);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
