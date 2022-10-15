import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/utils/app_colors.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({
    super.key,
    required this.child,
    this.isPadding = true,
  });
  final Widget child;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.vertical(top: Radius.circular(defaultRadius)),
      child: Ink(
        decoration: BoxDecoration(color: AppColors.customScafoldColor(context)),
        padding: isPadding
            ? EdgeInsets.only(
                top: defaultPadding,
                left: defaultPadding,
                right: defaultPadding,
              )
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
