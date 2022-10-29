import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/controllers/question_paper_controller/questions_controller.dart';
import 'package:kstudyapp/core/firebase/loading_status.dart';
import 'package:kstudyapp/pages/home/components/content_area.dart';
import 'package:kstudyapp/pages/questions/components/answer_card.dart';
import 'package:kstudyapp/pages/questions/components/background_decoration_widget.dart';
import 'package:kstudyapp/themes/txt_style.dart';
import 'package:kstudyapp/widgets/loading_widget.dart';

import '../../constants/app_constant.dart';
import '../../utils/dimensions.dart';
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
                const Expanded(
                    child: SafeArea(
                        child: ContentArea(child: QuestionLoadingShimmer()))),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: Dx.h40),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                            style: questionTextStyle,
                          ),
                          GetBuilder<QuestionsController>(
                              id: AppConstant.answerListId,
                              builder: (controller) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length,
                                  itemBuilder: (context, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                      answerText:
                                          "${describeEnum(answer.identifier!)}. ${answer.answer}",
                                      isSelected:
                                          describeEnum(answer.identifier!) ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                      onTap: () {
                                        controller.selectedAnswer(
                                            describeEnum(answer.identifier!));
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                );
                              })
                        ],
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
