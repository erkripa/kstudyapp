import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blueAccent,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
