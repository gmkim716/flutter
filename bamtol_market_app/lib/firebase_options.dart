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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKkp5utY_yl4HitBhS_JHh7ybu2pDNbkw',
    appId: '1:692493440619:android:18f0cd85454f2dbf41432e',
    messagingSenderId: '692493440619',
    projectId: 'bamtol-market-app-ee81c',
    storageBucket: 'bamtol-market-app-ee81c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAw62JwbJM95LNDfPu8tiU8ieBhZNjacwk',
    appId: '1:692493440619:ios:38a6a1b78337028541432e',
    messagingSenderId: '692493440619',
    projectId: 'bamtol-market-app-ee81c',
    storageBucket: 'bamtol-market-app-ee81c.appspot.com',
    iosBundleId: 'com.devman.cloneapp.bamtolMarketApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAw62JwbJM95LNDfPu8tiU8ieBhZNjacwk',
    appId: '1:692493440619:ios:38a6a1b78337028541432e',
    messagingSenderId: '692493440619',
    projectId: 'bamtol-market-app-ee81c',
    storageBucket: 'bamtol-market-app-ee81c.appspot.com',
    iosBundleId: 'com.devman.cloneapp.bamtolMarketApp',
  );
}
