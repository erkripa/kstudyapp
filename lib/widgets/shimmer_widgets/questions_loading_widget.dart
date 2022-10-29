import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kstudyapp/utils/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class QuestionLoadingShimmer extends StatelessWidget {
  const QuestionLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Container line = Container(
      height: Dx.h15,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    Container answer = Container(
      height: Dx.h10 * 5,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: EasySeparatedColumn(
        separatorBuilder: (context, index) => SizedBox(height: Dx.h20),
        children: [
          EasySeparatedColumn(
            separatorBuilder: (context, index) => SizedBox(height: Dx.h10),
            children: [line, line, line],
          ),
          answer,
          answer,
          answer,
          answer,
        ],
      ),
    );
  }
}
