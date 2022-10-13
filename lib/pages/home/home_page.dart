import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/controllers/question_paper_controller/question_paper_controller.dart';

import '../../widgets/custom_network_image.dart';
import '../../widgets/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();

    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemCount: questionPaperController.allPapers.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CustomNetworkImage(
                    questionPaperController.allPapers[index].imageUrl),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ),
    );
  }
}
