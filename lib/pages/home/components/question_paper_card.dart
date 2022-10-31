import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/configs/app_icons.dart';
import 'package:kstudyapp/widgets/ripple_effect.dart';
import '../../../configs/ui_parameters.dart';
import '../../../themes/txt_style.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_icon_widget.dart';
import '../../../widgets/custom_network_image.dart';

class QuestionPaperCard extends StatelessWidget {
  const QuestionPaperCard({
    Key? key,
    this.image,
    this.title,
    this.desc,
    this.questionCount,
    this.time,
    this.onTap,
  }) : super(key: key);

  final String? image;
  final String? title;
  final String? desc;
  final String? questionCount, time;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RippleEffect(
      onTap: onTap,
      radius: defaultPadding,
      child: Ink(
        padding: UIParameters.defaultAllPadding.copyWith(right: 0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: UIParameters.defaultCircularRadius,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dx.r10),
                  child: SizedBox(
                    height: Get.width * 0.15,
                    width: Get.width * 0.16,
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: CustomNetworkImage(image!),
                    ),
                  ),
                ),
                SizedBox(width: Dx.w10),
                //
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: questionPaperCardTitleStyle(context),
                    ),
                    SizedBox(height: Dx.h10),
                    Text(
                      desc!,
                      style: questionPaperCardDescStyle,
                    ),
                    SizedBox(height: Dx.h10),
                    Row(
                      children: [
                        AppIconWidget(
                          icon: Icons.help_outline_sharp,
                          iconColor: UIParameters.isDarkMode(context)
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          text: " $questionCount Questions",
                          textStyle: questionAndTimeTextstyle(context),
                        ),
                        SizedBox(width: Dx.w20),
                        AppIconWidget(
                          icon: Icons.timer_outlined,
                          iconColor: UIParameters.isDarkMode(context)
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          text: " $time",
                          textStyle: questionAndTimeTextstyle(context),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
            Positioned(
                bottom: -defaultPadding,
                right: 0,
                child: Container(
                  padding: UIParameters.defaultAllPadding,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius),
                      bottomRight: Radius.circular(defaultRadius),
                    ),
                  ),
                  child: const AppIconWidget(
                    icon: AppIcons.trophyOutLine,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
