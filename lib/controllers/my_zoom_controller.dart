import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  //
  final _zoomDrawerController = ZoomDrawerController();
  ZoomDrawerController get zoomDrawerController => _zoomDrawerController;

  void toggleZoomDrawer() {
    _zoomDrawerController.toggle?.call();
    update();
  }

  //signin
  void signIn() {}
  //signout
  void signOut() {}
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
}
