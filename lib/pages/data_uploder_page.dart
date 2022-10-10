import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/controllers/data_uploder_controller.dart';

class DataUploderPage extends StatelessWidget {
  const DataUploderPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataUploderController controller = Get.put(DataUploderController());
    return Scaffold(
      body: Center(child: Text("Uploading...")),
    );
  }
}
