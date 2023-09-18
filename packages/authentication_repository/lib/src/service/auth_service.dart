import 'package:authentication_repository/src/utils/error_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  Future login({required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return formatFirebaseLoginErrorMessage(e);
    }
  }

  Future logout() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      return e.message ?? 'An error occured while logging in';
    }
  }
}
