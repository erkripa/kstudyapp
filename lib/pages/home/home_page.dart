import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/configs/app_icons.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/controllers/question_paper_controller/question_paper_controller.dart';
import 'package:kstudyapp/pages/home/components/content_area.dart';
import 'package:kstudyapp/utils/app_colors.dart';
import 'package:kstudyapp/utils/dimensions.dart';
import 'package:kstudyapp/widgets/app_icon_widget.dart';

import '../../themes/txt_style.dart';
import 'components/question_paper_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.mainGradient()),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppIconWidget(
                      icon: AppIcons.menuLeft,
                    ),
                    SizedBox(height: Dx.h20),
                    AppIconWidget(
                      icon: AppIcons.peace,
                      text: " Hello Developer!",
                      textStyle: questionPaperCardDescStyle.copyWith(
                        color: AppColors.onSurfaceColor,
                      ),
                    ),
                    SizedBox(height: Dx.h10),
                    Text(
                      "What do you want to learn today?",
                      textAlign: TextAlign.start,
                      style: headeTextStyle,
                    )
                  ],
                ),
              ),
              Flexible(
                child: ContentArea(
                  // isPadding: false,
                  child: Obx(
                    () => ListView.separated(
                      itemCount: questionPaperController.allPapers.length,
                      itemBuilder: (context, index) {
                        final model = questionPaperController.allPapers[index];
                        return QuestionPaperCard(
                          image: model.imageUrl,
                          title: model.title,
                          desc: model.description,
                          questionCount: model.questionCount.toString(),
                          time: model.timeInMinutes(),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: Dx.h10),
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
