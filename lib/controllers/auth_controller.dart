import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kstudyapp/core/firebase/references.dart';
import 'package:kstudyapp/routes/route_constant.dart';
import 'package:kstudyapp/widgets/dialogs/alert_dialugue.dart';

import '../routes/navigations.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    //Pre initialization
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

  void signInWithGoogle() async {
    final GoogleSignIn googleSigIn = GoogleSignIn(
        clientId:
            '140362108373-2h30elep35saabuc1ae1jfhorm9fqsat.apps.googleusercontent.com');
    try {
      GoogleSignInAccount? account = await googleSigIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          //
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );
        await _auth.signInWithCredential(credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  saveUser(GoogleSignInAccount account) => usersRF.doc(account.email).set({
        "displayName": account.displayName,
        "email": account.email,
        "photoUrl": account.photoUrl,
      });

  void showAlertDialogue() {
    Get.dialog(
      Dialogs.startQuestionDialog("title", () {
        Get.back();
        navigateToLoginPage();
      }),
      barrierDismissible: false,
    );
  }

  //loggedinuser
  bool get isLoggedIn => _auth.currentUser != null;

  //get current user

  User? get getCurrentUser {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  //
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
