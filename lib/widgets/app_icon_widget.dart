import 'package:flutter/material.dart';
import 'package:kstudyapp/configs/ui_parameters.dart';
import 'package:kstudyapp/utils/dimensions.dart';
import 'package:kstudyapp/widgets/ripple_effect.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({
    Key? key,
    this.icon,
    this.iconColor,
    this.bgColor,
    this.child,
    this.text,
    this.onTap,
    this.isOnlyIcon,
    this.textStyle,
    this.size,
  }) : super(key: key);

  final IconData? icon;
  final Color? iconColor, bgColor;
  final Widget? child;
  final String? text;
  final VoidCallback? onTap;
  final bool? isOnlyIcon;
  final double? size;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return RippleEffect(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
              size: size ?? Dx.f18,
            ),
          if (child != null) child!,
          if (text != null)
            Text(
              text!,
              style: textStyle,
            )
        ],
      ),
    );
  }
}
