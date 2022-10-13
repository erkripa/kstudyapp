import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/controllers/question_paper_controller/question_paper_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();

    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemCount: questionPaperController.allPappers.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: FadeInImage(
                  image:
                      NetworkImage(questionPaperController.allPappers[index]),
                  placeholder:
                      const AssetImage('assets/images/app_splash_logo.png'),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ),
    );
  }
}
