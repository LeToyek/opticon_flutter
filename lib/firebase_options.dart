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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCqeylTy82GHUvctYhoo2jK7SCrlp0ki14',
    appId: '1:1044228242957:web:d15a8701c95d6bc4151f44',
    messagingSenderId: '1044228242957',
    projectId: 'opticon-final',
    authDomain: 'opticon-final.firebaseapp.com',
    storageBucket: 'opticon-final.appspot.com',
    measurementId: 'G-YR800S2Y4B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD73zU37v8uHMzGOVHfnKOWNGMBxREPUHc',
    appId: '1:1044228242957:android:51e57be2b0ec0c51151f44',
    messagingSenderId: '1044228242957',
    projectId: 'opticon-final',
    storageBucket: 'opticon-final.appspot.com',
  );
}
