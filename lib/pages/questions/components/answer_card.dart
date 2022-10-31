import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/utils/app_colors.dart';
import 'package:kstudyapp/utils/dimensions.dart';

import '../../../widgets/ripple_effect.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.answerText,
    this.isSelected = false,
    required this.onTap,
  });

  final String answerText;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RippleEffect(
      onTap: onTap,
      radius: defaultRadius,
      child: Ink(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: Dx.w20, vertical: Dx.h20),
        decoration: BoxDecoration(
          borderRadius: UIParameters.defaultCircularRadius,
          color: isSelected
              ? AppColors.answerSelectedColor(context)
              : Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected
                ? AppColors.answerSelectedColor(context)
                : AppColors.answerBorderColor(context),
          ),
        ),
        child: Text(
          answerText,
          style: TextStyle(
            color: isSelected ? AppColors.onSurfaceColor : null,
          ),
        ),
      ),
    );
  }
}
