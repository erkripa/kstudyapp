// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDuqYV8pZtcjCWH7zHc5yJqL8WbEkAE5PM',
    appId: '1:140362108373:web:2c18ed6d109158b4c4015c',
    messagingSenderId: '140362108373',
    projectId: 'kstudyapp',
    authDomain: 'kstudyapp.firebaseapp.com',
    storageBucket: 'kstudyapp.appspot.com',
    measurementId: 'G-2C8W3CVHY8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBipGbCwtr2-21i6SStbeUP8jEhfzQW4Lo',
    appId: '1:140362108373:android:798cae750e8eb342c4015c',
    messagingSenderId: '140362108373',
    projectId: 'kstudyapp',
    storageBucket: 'kstudyapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjHUHWkyRECSASKHmUji_S8yq8MvwHqSo',
    appId: '1:140362108373:ios:ba37c5226ad79e51c4015c',
    messagingSenderId: '140362108373',
    projectId: 'kstudyapp',
    storageBucket: 'kstudyapp.appspot.com',
    iosClientId: '140362108373-2h30elep35saabuc1ae1jfhorm9fqsat.apps.googleusercontent.com',
    iosBundleId: 'com.example.kstudyapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjHUHWkyRECSASKHmUji_S8yq8MvwHqSo',
    appId: '1:140362108373:ios:ba37c5226ad79e51c4015c',
    messagingSenderId: '140362108373',
    projectId: 'kstudyapp',
    storageBucket: 'kstudyapp.appspot.com',
    iosClientId: '140362108373-2h30elep35saabuc1ae1jfhorm9fqsat.apps.googleusercontent.com',
    iosBundleId: 'com.example.kstudyapp',
  );
}
