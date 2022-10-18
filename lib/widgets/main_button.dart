import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/ui_parameters.dart';
import '../themes/txt_style.dart';
import '../utils/dimensions.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    this.onTap,
    this.text,
    this.leftIcon,
    this.svgPath,
    this.color,
    this.isEnabled = true,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? text;
  final IconData? leftIcon;
  final String? svgPath;
  final Color? color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onTap ?? () {} : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        padding: UIParameters.defaultAllPadding / 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: Dx.w10 / 2),
          if (svgPath != null)
            SvgPicture.asset(
              svgPath!,
              height: Dx.h30,
              width: Dx.w30,
            ),
          if (leftIcon != null)
            Icon(
              leftIcon,
            ),
          Flexible(
            child: Center(
              child: Text(
                text ?? '',
                style: loginInfoTextStyle.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
