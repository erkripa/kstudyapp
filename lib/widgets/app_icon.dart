import 'package:flutter/material.dart';
import 'package:kstudyapp/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.child,
    this.onTap,
    this.icon,
    this.color,
    this.width = 0,
  });

  final Widget? child;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: icon == null
            ? child
            : Icon(icon, color: color, size: width == 0 ? Dx.w20 : width),
      ),
    );
  }
}
