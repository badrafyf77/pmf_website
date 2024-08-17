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
    apiKey: 'AIzaSyA7DVHrYJKeXtjQW-1g75KgMPYseFa7pXU',
    appId: '1:289024383022:web:5ff9092c8ee0246d39e7bf',
    messagingSenderId: '289024383022',
    projectId: 'db-pmf-8e245',
    authDomain: 'db-pmf-8e245.firebaseapp.com',
    storageBucket: 'db-pmf-8e245.appspot.com',
    measurementId: 'G-5BL3CS0372',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCU_dSgJ5WG-Kmr9OXXpKUkqv_LYfaqs9E',
    appId: '1:289024383022:android:c28f5630cc30819039e7bf',
    messagingSenderId: '289024383022',
    projectId: 'db-pmf-8e245',
    storageBucket: 'db-pmf-8e245.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMLA1-bUyugg_A9mrbmkcoIGJIeYvuq0k',
    appId: '1:289024383022:ios:2319bd8e67f667fc39e7bf',
    messagingSenderId: '289024383022',
    projectId: 'db-pmf-8e245',
    storageBucket: 'db-pmf-8e245.appspot.com',
    iosBundleId: 'com.example.pmfwebsite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMLA1-bUyugg_A9mrbmkcoIGJIeYvuq0k',
    appId: '1:289024383022:ios:2319bd8e67f667fc39e7bf',
    messagingSenderId: '289024383022',
    projectId: 'db-pmf-8e245',
    storageBucket: 'db-pmf-8e245.appspot.com',
    iosBundleId: 'com.example.pmfwebsite',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7DVHrYJKeXtjQW-1g75KgMPYseFa7pXU',
    appId: '1:289024383022:web:e88554e1afbfb5e439e7bf',
    messagingSenderId: '289024383022',
    projectId: 'db-pmf-8e245',
    authDomain: 'db-pmf-8e245.firebaseapp.com',
    storageBucket: 'db-pmf-8e245.appspot.com',
    measurementId: 'G-VRRWSV7EMS',
  );

}