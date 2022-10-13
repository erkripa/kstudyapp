import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
    this.imgUrl, {
    Key? key,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      placeholder: (context, url) => LoadingWidget(),
      errorWidget: (context, url, error) =>
          Image.asset('assets/images/app_splash_logo.png'),
    );
  }
}
