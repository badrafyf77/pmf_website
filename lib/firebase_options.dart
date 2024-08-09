// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD-MZnVh9TbhxMNBN4K9VWJqOuNMF6hbrI',
    appId: '1:1035631766526:web:5f538f77e8470158a22eaf',
    messagingSenderId: '1035631766526',
    projectId: 'pmf-website',
    authDomain: 'pmf-website.firebaseapp.com',
    storageBucket: 'pmf-website.appspot.com',
    measurementId: 'G-3G8XVJJN02',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCphwgYqiuZgZCITZqATKn1K4jgzorZKrg',
    appId: '1:1035631766526:android:7960a63e65fb0a74a22eaf',
    messagingSenderId: '1035631766526',
    projectId: 'pmf-website',
    storageBucket: 'pmf-website.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDne8OTkVcSDRc8hl3QGteSy02m78pImSM',
    appId: '1:1035631766526:ios:dc05a8f646b72eeea22eaf',
    messagingSenderId: '1035631766526',
    projectId: 'pmf-website',
    storageBucket: 'pmf-website.appspot.com',
    iosBundleId: 'com.example.stageWebsite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDne8OTkVcSDRc8hl3QGteSy02m78pImSM',
    appId: '1:1035631766526:ios:dc05a8f646b72eeea22eaf',
    messagingSenderId: '1035631766526',
    projectId: 'pmf-website',
    storageBucket: 'pmf-website.appspot.com',
    iosBundleId: 'com.example.stageWebsite',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-MZnVh9TbhxMNBN4K9VWJqOuNMF6hbrI',
    appId: '1:1035631766526:web:a37292655b78361ca22eaf',
    messagingSenderId: '1035631766526',
    projectId: 'pmf-website',
    authDomain: 'pmf-website.firebaseapp.com',
    storageBucket: 'pmf-website.appspot.com',
    measurementId: 'G-7WQLF7R4QQ',
  );
}
