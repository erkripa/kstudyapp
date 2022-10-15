import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/bindings/initial_binding.dart';
import 'package:kstudyapp/controllers/theme_controllers/theme_controller.dart';
import 'package:kstudyapp/core/firebase_options.dart';
import 'package:kstudyapp/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KStudy App',
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      darkTheme: Get.find<ThemeController>().darkTheme,
      themeMode: ThemeMode.light,

      // home: const DataUploderPage(),

      getPages: AppRoutes.routes(),
    );
  }
}
