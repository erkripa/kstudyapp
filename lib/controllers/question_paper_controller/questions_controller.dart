import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/core/firebase/loading_status.dart';
import 'package:kstudyapp/core/firebase/references.dart';
import 'package:kstudyapp/models/question_paper_model.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  late List<Question> allQuestions = <Question>[];
  Rx<LoadingStatus> loadingStatus = LoadingStatus.loading.obs;

  //
  @override
  void onReady() {
    //this model is passed when  this controller is initialized and navigating to question page
    final questionPaperModel = Get.arguments as QuestionPaperModel;
    // print(questionPaperModel.title);
    loadData(questionPaperModel);
    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel model) async {
    questionPaperModel = model;
    loadingStatus.value = LoadingStatus.loading;
    //
    try {
      final QuerySnapshot<Map<String, dynamic>> questionsQuerySnapshot =
          await questionPapersCollectionRF
              .doc(questionPaperModel.id)
              .collection('questions')
              .get();
      //
      final questions = questionsQuerySnapshot.docs
          .map((snapshot) => Question.fromSnapshot(snapshot))
          .toList();
      questionPaperModel.questions = questions;
      //
      for (Question question in questionPaperModel.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answerQuerySnapshot =
            await questionPapersCollectionRF
                .doc(questionPaperModel.id)
                .collection('questions')
                .doc(question.id)
                .collection('answers')
                .get();

        final answers = answerQuerySnapshot.docs
            .map((snapshot) => Answer.fromSnapshot(snapshot))
            .toList();

        question.answers = answers;
        if (questionPaperModel.questions != null &&
            questionPaperModel.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaperModel.questions!);
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
      print(allQuestions[0].question);
    } catch (e) {
      log(e.toString());
    }
  }
}
