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
    apiKey: 'AIzaSyAGXWRxfq2mlZrQCtNLkAHGsN3ZoFUAENo',
    appId: '1:385587653703:web:57115b60fb18c0660bd562',
    messagingSenderId: '385587653703',
    projectId: 'todo-app-ab1dc',
    authDomain: 'todo-app-ab1dc.firebaseapp.com',
    storageBucket: 'todo-app-ab1dc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAPtliZ74Ij8-sch4TYFQPBZzl_lY1SUY',
    appId: '1:385587653703:android:499479cb0ad9f70e0bd562',
    messagingSenderId: '385587653703',
    projectId: 'todo-app-ab1dc',
    storageBucket: 'todo-app-ab1dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbXGrp5AZWBeCHiB5T3WbPuL_sVqpjnfU',
    appId: '1:385587653703:ios:976b3da766764d710bd562',
    messagingSenderId: '385587653703',
    projectId: 'todo-app-ab1dc',
    storageBucket: 'todo-app-ab1dc.appspot.com',
    iosClientId: '385587653703-02qsg4k1fa4kf17q8lou6drn846sprjb.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbXGrp5AZWBeCHiB5T3WbPuL_sVqpjnfU',
    appId: '1:385587653703:ios:976b3da766764d710bd562',
    messagingSenderId: '385587653703',
    projectId: 'todo-app-ab1dc',
    storageBucket: 'todo-app-ab1dc.appspot.com',
    iosClientId: '385587653703-02qsg4k1fa4kf17q8lou6drn846sprjb.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}
