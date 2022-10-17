import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/navigations.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initAuth();

    super.onReady();
  }

  late FirebaseAuth _auth;
  final Rxn<User> _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) => _user.value = user);
    navigateToIntroductionPage();
  }
}
