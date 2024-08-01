import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoe_mart/models/user_model.dart';

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
        final UserModel loggedUser = UserModel(
            userName: currentUser.displayName ?? 'User', userEmail: email);
        return loggedUser;
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
        final UserModel loggedUser = UserModel(
            userName: currentUser.displayName ?? 'User', userEmail: email);
        return loggedUser;
      }
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> resetPasswordUsingEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return true;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> reauthenticateUser({required String currentPassword}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.email != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!, password: currentPassword);

        await user.reauthenticateWithCredential(credential);

        return true;
      }
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> changePassword({required String newPassword}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);

        return true;
      }
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
