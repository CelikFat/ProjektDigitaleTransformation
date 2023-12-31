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
    apiKey: 'AIzaSyC0KhwARaK6Uic3sfJhIYPotAWSyogbtZ4',
    appId: '1:490999702136:web:1fd104b71f4b21bd4b838d',
    messagingSenderId: '490999702136',
    projectId: 'studicafe-albsig',
    authDomain: 'studicafe-albsig.firebaseapp.com',
    databaseURL: 'https://studicafe-albsig-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'studicafe-albsig.appspot.com',
    measurementId: 'G-4EHLMBSH4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjm7-Y3FX2JQeXQMCSo4pT_97rQxji6XQ',
    appId: '1:490999702136:android:a861909a7f5a44134b838d',
    messagingSenderId: '490999702136',
    projectId: 'studicafe-albsig',
    databaseURL: 'https://studicafe-albsig-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'studicafe-albsig.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmuaHipMSI-W-7Ycck6UjDtAdunWwHIMA',
    appId: '1:490999702136:ios:982e736a9aeb24e14b838d',
    messagingSenderId: '490999702136',
    projectId: 'studicafe-albsig',
    databaseURL: 'https://studicafe-albsig-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'studicafe-albsig.appspot.com',
    iosBundleId: 'com.example.studiCafe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmuaHipMSI-W-7Ycck6UjDtAdunWwHIMA',
    appId: '1:490999702136:ios:3be13768424b96ff4b838d',
    messagingSenderId: '490999702136',
    projectId: 'studicafe-albsig',
    databaseURL: 'https://studicafe-albsig-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'studicafe-albsig.appspot.com',
    iosBundleId: 'com.example.studiCafe.RunnerTests',
  );
}
