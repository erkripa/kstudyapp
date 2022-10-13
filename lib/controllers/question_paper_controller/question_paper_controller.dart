import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kstudyapp/core/firebase/references.dart';
import 'package:kstudyapp/models/question_paper_model.dart';
import 'package:kstudyapp/services/firebase_storage_services.dart';

import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPappersImage = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> paperNameList = ["biology", "chemistry", "maths", "physics"];

    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await questionPapersCollectionRF.get();

      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshots(paper))
          .toList();

      allPapers.assignAll(paperList);
      print(allPapers);

      for (var paper in paperList) {
        //downlod from storage
        final downlodedPaperImgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = downlodedPaperImgUrl!;
      }

      allPapers.assignAll(paperList);
    } catch (e) {
      log("----" + e.toString());
    }
  }
}
