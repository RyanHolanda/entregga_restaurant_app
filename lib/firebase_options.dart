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
    apiKey: 'AIzaSyBqZt4tEU3ykPNRg6RQurzqAOLbqJ-3KZQ',
    appId: '1:860665126566:web:858872613c6913528b5e67',
    messagingSenderId: '860665126566',
    projectId: 'entregga-6d50c',
    authDomain: 'entregga-6d50c.firebaseapp.com',
    storageBucket: 'entregga-6d50c.appspot.com',
    measurementId: 'G-ZNBR2SHWDD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9uBiRsGgN31NWbpy-UlHKlnmkbb-412Y',
    appId: '1:860665126566:android:0d0330c9ed446c8d8b5e67',
    messagingSenderId: '860665126566',
    projectId: 'entregga-6d50c',
    storageBucket: 'entregga-6d50c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRF6O_QqflIkRNzc42XpGavqzlsYVixCY',
    appId: '1:860665126566:ios:5619e87b7a5db0e98b5e67',
    messagingSenderId: '860665126566',
    projectId: 'entregga-6d50c',
    storageBucket: 'entregga-6d50c.appspot.com',
    iosClientId: '860665126566-qh547ktvs5844tqkoqf298e5j7838fuq.apps.googleusercontent.com',
    iosBundleId: 'com.entregga',
  );
}