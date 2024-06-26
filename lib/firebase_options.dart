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
    apiKey: 'AIzaSyCO-Ge_JFdTpuClX0LkuENqoOiKtOjOwUY',
    appId: '1:462207427253:web:7f350c7651a7d8a57b94fc',
    messagingSenderId: '462207427253',
    projectId: 'project-vc10',
    authDomain: 'project-vc10.firebaseapp.com',
    storageBucket: 'project-vc10.appspot.com',
    measurementId: 'G-97RX3K3WQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXlM3MTCVqda3dWdKyIOvBPHcow_gChVg',
    appId: '1:462207427253:android:dda4f5941b5c08297b94fc',
    messagingSenderId: '462207427253',
    projectId: 'project-vc10',
    storageBucket: 'project-vc10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8yUhev6gKrqGXQzM1t2-tQjQtYwp8ljI',
    appId: '1:462207427253:ios:3b943fb057c14fd67b94fc',
    messagingSenderId: '462207427253',
    projectId: 'project-vc10',
    storageBucket: 'project-vc10.appspot.com',
    iosClientId:
        '462207427253-f3r1s1u00a0co8ie2an31lt1d51vq0ve.apps.googleusercontent.com',
    iosBundleId: 'com.example.food',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8yUhev6gKrqGXQzM1t2-tQjQtYwp8ljI',
    appId: '1:462207427253:ios:4529623a352443fd7b94fc',
    messagingSenderId: '462207427253',
    projectId: 'project-vc10',
    storageBucket: 'project-vc10.appspot.com',
    iosClientId:
        '462207427253-ckjgotdsnsvnvonfaiferag0uf6bl1e8.apps.googleusercontent.com',
    iosBundleId: 'com.example.food.RunnerTests',
  );
}
