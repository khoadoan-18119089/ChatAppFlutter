import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/main/main_view.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class PerformanceFb {
  static void sign_inAuth(
      String email, String pass, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Main_view()));
    } catch (e) {}
  }

  static void createAuth(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
    } catch (e) {}
  }
}
