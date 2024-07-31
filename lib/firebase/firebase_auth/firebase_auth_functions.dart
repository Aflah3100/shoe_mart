import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFunctions {
  //Singleton
  FirebaseAuthFunctions._internal();
  static FirebaseAuthFunctions instance = FirebaseAuthFunctions._internal();
  factory FirebaseAuthFunctions() => instance;

  Future<dynamic> registerUserUsingEmail(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? currentUser = userCredential.user;

      if (currentUser != null) {
        await FirebaseAuth.instance.currentUser!
            .updateProfile(displayName: name);
        return true;
      }
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> signInUserUsingEmail(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? currentUser = userCredential.user;

      if (currentUser != null) {
        return true;
      }
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
