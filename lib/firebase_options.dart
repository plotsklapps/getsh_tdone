// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyA-CdLkpB0oOMo4xCKBQ0tJ-aBSiQwDRhU',
    appId: '1:993672599625:web:23387b5f81150e93470798',
    messagingSenderId: '993672599625',
    projectId: 'getsh-tdone',
    authDomain: 'getsh-tdone.firebaseapp.com',
    storageBucket: 'getsh-tdone.appspot.com',
    measurementId: 'G-NSSBRPDKGE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4x2E8VsF8OE5ELN6dL6wJsI4Y2m2SyM8',
    appId: '1:993672599625:android:5d799ab699795317470798',
    messagingSenderId: '993672599625',
    projectId: 'getsh-tdone',
    storageBucket: 'getsh-tdone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCk2JwbgxUb9Whe9kzocKFrJYX3ZWDaIQ8',
    appId: '1:993672599625:ios:70bcdd4d13af796e470798',
    messagingSenderId: '993672599625',
    projectId: 'getsh-tdone',
    storageBucket: 'getsh-tdone.appspot.com',
    iosBundleId: 'dev.plotsklapps.getshTdone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCk2JwbgxUb9Whe9kzocKFrJYX3ZWDaIQ8',
    appId: '1:993672599625:ios:4a9e6cf535671939470798',
    messagingSenderId: '993672599625',
    projectId: 'getsh-tdone',
    storageBucket: 'getsh-tdone.appspot.com',
    iosBundleId: 'dev.plotsklapps.getshTdone.RunnerTests',
  );
}
