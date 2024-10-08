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
    apiKey: 'AIzaSyD4Pk0JhV4xqZMdOcx9SlDJw9warPkIMUk',
    appId: '1:157378580091:web:aaf468e374f8a166229cde',
    messagingSenderId: '157378580091',
    projectId: 'gold-mart-9c3b4',
    authDomain: 'gold-mart-9c3b4.firebaseapp.com',
    storageBucket: 'gold-mart-9c3b4.appspot.com',
    measurementId: 'G-GH0TJ4W2YS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDv_CLitihjQLM7kAi-BDUbw9FxytAmxV0',
    appId: '1:157378580091:android:90c9b7d9bdf34c38229cde',
    messagingSenderId: '157378580091',
    projectId: 'gold-mart-9c3b4',
    storageBucket: 'gold-mart-9c3b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhFhYydE-c6nw3ModirPE8QOe7CFDxEjw',
    appId: '1:157378580091:ios:82a6a4078444442e229cde',
    messagingSenderId: '157378580091',
    projectId: 'gold-mart-9c3b4',
    storageBucket: 'gold-mart-9c3b4.appspot.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhFhYydE-c6nw3ModirPE8QOe7CFDxEjw',
    appId: '1:157378580091:ios:82a6a4078444442e229cde',
    messagingSenderId: '157378580091',
    projectId: 'gold-mart-9c3b4',
    storageBucket: 'gold-mart-9c3b4.appspot.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD4Pk0JhV4xqZMdOcx9SlDJw9warPkIMUk',
    appId: '1:157378580091:web:75593c15e5a8359f229cde',
    messagingSenderId: '157378580091',
    projectId: 'gold-mart-9c3b4',
    authDomain: 'gold-mart-9c3b4.firebaseapp.com',
    storageBucket: 'gold-mart-9c3b4.appspot.com',
    measurementId: 'G-4XEFX9JC14',
  );

}