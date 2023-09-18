import 'package:firebase_auth/firebase_auth.dart';

String formatFirebaseLoginErrorMessage(FirebaseAuthException code) {
  switch (code.code) {
    case 'account-exists-with-different-credential':
      return 'Account exists with different credentials.';
    case 'invalid-credential':
      return 'The credential received is malformed or has expired.';
    case 'operation-not-allowed':
      return 'Operation is not allowed.  Please contact support.';
    case 'user-disabled':
      return 'This user has been disabled. Please contact support for help.';
    case 'user-not-found':
      return 'Email is not found, please create an account.';
    case 'wrong-password':
      return 'Incorrect password, please try again.';
    case 'invalid-verification-code':
      return 'The credential verification code received is invalid.';

    case 'invalid-verification-id':
      return 'The credential verification ID received is invalid.';
    default:
      return code.message ?? 'An error occured while logging in';
  }
}
