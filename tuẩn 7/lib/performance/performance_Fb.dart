import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class PerformanceFb {
  static void sign_inAuth(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
    } catch (e) {}
  }

  static void createAuth(String email, String pass) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pass);
    } catch (e) {}
  }
}
