import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAPNXEYbufLJN2r66w9p8_Zh5rvlohmwyw",
            authDomain: "carros-c0280.firebaseapp.com",
            projectId: "carros-c0280",
            storageBucket: "carros-c0280.appspot.com",
            messagingSenderId: "512925122495",
            appId: "1:512925122495:web:1fe717368932ebeacbab0a"));
  } else {
    await Firebase.initializeApp();
  }
}
