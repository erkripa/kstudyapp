import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._iternal();
  Dialogs._iternal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget startQuestionDialog(String title, VoidCallback onTap) {
    return AlertDialog(
      title: const Text("Hi , User Please Login"),
      actions: [
        TextButton(onPressed: onTap, child: const Text('Okay')),
      ],
    );
  }
}
