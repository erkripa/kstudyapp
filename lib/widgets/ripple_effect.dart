import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kstudyapp/themes/app_dark_theme.dart';
import 'package:kstudyapp/themes/app_light_theme.dart';
import 'package:kstudyapp/utils/app_colors.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class RippleEffect extends StatelessWidget {
  const RippleEffect({super.key, this.onTap, required this.child, this.radius});

  final VoidCallback? onTap;
  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TouchRippleEffect(
      rippleColor: primaryColorLight.withOpacity(0.5),
      onTap: onTap ?? () {},
      child: child,
      borderRadius: BorderRadius.circular(radius ?? 0),
    );
  }
}
