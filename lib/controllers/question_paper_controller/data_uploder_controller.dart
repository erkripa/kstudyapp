import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/core/firebase/loading_status.dart';
import 'package:kstudyapp/core/firebase/references.dart';
import 'package:kstudyapp/models/question_paper_model.dart';

class DataUploderController extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;

    final fireStore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
//load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    // debugPrint(papersInAssets.toString());
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      // print(stringPaperContent);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    //
    // print("length ${questionPapers[0].questions}");
    // print("length ${questionPapers}");
    final batch = fireStore.batch();

    //1st for loop
    for (var paper in questionPapers) {
      batch.set(questionPapersCollectionRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_second": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions?.length,
      });
      //2nd for loop
      for (var question in paper.questions!) {
        //to create a questions collecton ref
        final questionsCollectionRF = questionsCollectionReF(paperId: paper.id);

        batch.set(questionsCollectionRF.doc(question.id), {
          "question": question.question,
          "correct_answer": describeEnum(question.correctAnswer!),
        });
        //3rd for loop
        for (var answer in question.answers) {
          //to create a answers collecton ref
          final answersCollectionRF = answersCollectionReF(
            questionsPaperCollectionRF: questionsCollectionRF,
            questionId: question.id,
          );
          batch.set(answersCollectionRF.doc(describeEnum(answer.identifier!)), {
            "identifier": describeEnum(answer.identifier!),
            "answer": answer.answer,
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
