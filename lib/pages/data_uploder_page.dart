import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/controllers/data_uploder_controller.dart';
import 'package:kstudyapp/firebase/loading_status.dart';

class DataUploderPage extends StatelessWidget {
  const DataUploderPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataUploderController controller = Get.put(DataUploderController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? "Uploading Completed "
                : "Uploading...",
          ),
        ),
      ),
    );
  }
}
