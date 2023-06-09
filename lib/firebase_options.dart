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
    apiKey: 'AIzaSyCNtm8o7ayPqyt3tLdr-oMlk-DbyL985Cc',
    appId: '1:120214415491:web:5dae26056fa8240e01d3b6',
    messagingSenderId: '120214415491',
    projectId: 'tamagotchiapp',
    authDomain: 'tamagotchiapp.firebaseapp.com',
    storageBucket: 'tamagotchiapp.appspot.com',
    measurementId: 'G-Y2TMEGWJ95',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxTIMutfPFVROh32Vl_M-IECf-9yu9cI0',
    appId: '1:120214415491:android:7dbd34be15d71e9401d3b6',
    messagingSenderId: '120214415491',
    projectId: 'tamagotchiapp',
    storageBucket: 'tamagotchiapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDV6kj3_LGjmQsacWfk2A4Tmj47AVpBcJI',
    appId: '1:120214415491:ios:d2452e18c88958b701d3b6',
    messagingSenderId: '120214415491',
    projectId: 'tamagotchiapp',
    storageBucket: 'tamagotchiapp.appspot.com',
    iosClientId: '120214415491-t5u4o6eccfp9ooulo7qfo5vkqhsqvpuv.apps.googleusercontent.com',
    iosBundleId: 'com.example.tamagotchiApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDV6kj3_LGjmQsacWfk2A4Tmj47AVpBcJI',
    appId: '1:120214415491:ios:d2452e18c88958b701d3b6',
    messagingSenderId: '120214415491',
    projectId: 'tamagotchiapp',
    storageBucket: 'tamagotchiapp.appspot.com',
    iosClientId: '120214415491-t5u4o6eccfp9ooulo7qfo5vkqhsqvpuv.apps.googleusercontent.com',
    iosBundleId: 'com.example.tamagotchiApp',
  );
}
