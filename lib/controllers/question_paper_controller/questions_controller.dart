import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/models/question_paper_model.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  @override
  void onReady() {
    //this model is passed when  this controller is initialized and navigating to question page
    final _questionPaperModel = Get.arguments as QuestionPaperModel;
    // print(questionPaperModel.title);
    loadData(_questionPaperModel);
    super.onReady();
  }

  void loadData(QuestionPaperModel model) {
    questionPaperModel = model;
  }
}
