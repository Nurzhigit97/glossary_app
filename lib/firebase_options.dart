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
    apiKey: 'AIzaSyBkI7tkt0sbotxog87l7cQUev1I-Rhc2PA',
    appId: '1:242517483565:web:45b1b90a400e13a75918a4',
    messagingSenderId: '242517483565',
    projectId: 'glossary-1ef04',
    authDomain: 'glossary-1ef04.firebaseapp.com',
    storageBucket: 'glossary-1ef04.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0VDxhymQ5FfBhfzO0doz5VBsr3TScWVc',
    appId: '1:242517483565:android:f3fd263d1e372aeb5918a4',
    messagingSenderId: '242517483565',
    projectId: 'glossary-1ef04',
    storageBucket: 'glossary-1ef04.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaIQCvWItxiGFkxyciqn1J0Chvehm9KPk',
    appId: '1:242517483565:ios:9297af97d2c177c85918a4',
    messagingSenderId: '242517483565',
    projectId: 'glossary-1ef04',
    storageBucket: 'glossary-1ef04.appspot.com',
    iosClientId:
        '242517483565-5o9gr9g0n94p6ac5v4to3r5mqd52u653.apps.googleusercontent.com',
    iosBundleId: 'com.example.glossaryApp',
  );
}