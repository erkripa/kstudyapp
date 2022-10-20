import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/controllers/question_paper_controller/questions_controller.dart';
import 'package:kstudyapp/pages/questions/components/background_decoration_widget.dart';

class QuestionsPage extends GetView<QuestionsController> {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundDecoration(
      child: Center(
        child: Text('asdfgvbn'),
      ),
    ));
  }
}
