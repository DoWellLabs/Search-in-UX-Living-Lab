import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDpGygMEesMI1tucBfXILDD-JiZv54D5Mg",
            authDomain: "search-livinglab-map.firebaseapp.com",
            projectId: "search-livinglab-map",
            storageBucket: "search-livinglab-map.appspot.com",
            messagingSenderId: "482902116718",
            appId: "1:482902116718:web:4f5fc32085610cff77997f",
            measurementId: "G-J2312KVQ70"));
  } else {
    await Firebase.initializeApp();
  }
}
