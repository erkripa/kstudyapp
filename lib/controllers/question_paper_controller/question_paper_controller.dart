import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kstudyapp/controllers/auth_controller.dart';
import 'package:kstudyapp/core/firebase/references.dart';
import 'package:kstudyapp/models/question_paper_model.dart';
import 'package:kstudyapp/routes/route_constant.dart';
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
      // print(allPapers);

      for (var paper in paperList) {
        //downlod from storage
        final downlodedPaperImgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = downlodedPaperImgUrl!;
        // log(paper.id);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      log("----$e");
      debugPrint("af");
    }
  }

  //naviagtetoQuestions
  void naviagteToQuestion(
      {required QuestionPaperModel model, bool tryAgain = false}) {
    AuthController authController = Get.find();
    //if user is logged in
    if (authController.isLoggedIn) {
      if (tryAgain) {
        Get.back();
      } else {
        //Get.toNamed
        log("looged in");
        // FirebaseAuth.instance.signOut();
        Get.toNamed(AppRouteName.questionsPage, arguments: model);
      }
    } else {
      authController.showAlertDialogue();
    }
  }
}
