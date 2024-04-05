import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<void> signIn({
    required String number,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
  });

  Future<UserCredential> submitOTP({
    required String otpCode,
    required String verificationId,
  });
}
