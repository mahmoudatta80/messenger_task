import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService(this.firebaseAuth);

  FirebaseAuth instance = FirebaseAuth.instance;

  signIn({
    required String number,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
  }) async {
    await instance.verifyPhoneNumber(
      phoneNumber: '+20$number',
      timeout: const Duration(seconds: 14),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await instance.signInWithCredential(credential);
      },
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<UserCredential> submitOTP({
    required String otpCode,
    required String verificationId,
  }) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    UserCredential userCredential =
        await instance.signInWithCredential(credential);
    return userCredential;
  }
}
