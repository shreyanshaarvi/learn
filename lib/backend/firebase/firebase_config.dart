import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB_uoG8iB5t_blc2UbNsa_3yzaq5G_n36s",
            authDomain: "wallpaper-6f55b.firebaseapp.com",
            projectId: "wallpaper-6f55b",
            storageBucket: "wallpaper-6f55b.appspot.com",
            messagingSenderId: "239866788373",
            appId: "1:239866788373:web:4e321401ebe5549e4aac1c",
            measurementId: "G-5BNGLG4Y8Z"));
  } else {
    await Firebase.initializeApp();
  }
}
