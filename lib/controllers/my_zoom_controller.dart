import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kstudyapp/controllers/auth_controller.dart';
import 'package:kstudyapp/routes/navigations.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  //
  final _zoomDrawerController = ZoomDrawerController();
  ZoomDrawerController get zoomDrawerController => _zoomDrawerController;

  final Rxn<User?> _user = Rxn();
  Rxn<User?> get user => _user;

  @override
  void onReady() {
    _user.value = Get.find<AuthController>().getCurrentUser;
    super.onReady();
  }

  void toggleZoomDrawer() {
    _zoomDrawerController.toggle?.call();
    update();
  }

  //signin
  void signIn() {}
  //signout
  void signOut() {
    Get.find<AuthController>().signOut();
    navigateToHomePage();
  }

  //website
  void website() {}
  //email
  void email() {
    final emailUri = Uri(scheme: "mailto", path: "info@kstudy.com");
    _launchUrl(emailUri);
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw "Could not launched";
    }
  }

  void facebook() {}
}
