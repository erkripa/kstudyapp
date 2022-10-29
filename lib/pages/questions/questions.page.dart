import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/controllers/question_paper_controller/questions_controller.dart';
import 'package:kstudyapp/core/firebase/loading_status.dart';
import 'package:kstudyapp/pages/home/components/content_area.dart';
import 'package:kstudyapp/pages/questions/components/background_decoration_widget.dart';
import 'package:kstudyapp/themes/txt_style.dart';
import 'package:kstudyapp/widgets/loading_widget.dart';

import '../../widgets/shimmer_widgets/questions_loading_widget.dart';

class QuestionsPage extends GetView<QuestionsController> {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Center(
                  child: ContentArea(child: QuestionLoadingShimmer()),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: Center(
                      child: Text(
                        controller.allQuestions[0].question,
                        style: questionTextStyle,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
