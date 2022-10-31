import 'package:flutter/material.dart';
import 'package:kstudyapp/pages/questions/components/background_painter.dart';
import 'package:kstudyapp/utils/app_colors.dart';

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({
    super.key,
    required this.child,
    this.isShowGradient = false,
  });

  final Widget child;
  final bool isShowGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isShowGradient ? null : Theme.of(context).primaryColor,
        gradient: isShowGradient ? AppColors.mainGradient(context) : null,
      ),
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: child,
      ),
    );
  }
}
