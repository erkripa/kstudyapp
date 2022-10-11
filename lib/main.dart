import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstudyapp/bindings/initial_binding.dart';
import 'package:kstudyapp/core/firebase_options.dart';
import 'package:kstudyapp/routes/app_routes.dart';

import 'pages/data/data_uploder_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DataUploderPage(),
      getPages: AppRoutes.routes(),
    );
  }
}
