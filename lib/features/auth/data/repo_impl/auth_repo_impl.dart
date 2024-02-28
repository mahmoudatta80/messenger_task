import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_task/core/utils/firebase_auth_service.dart';
import 'package:messenger_task/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<void> signIn({
    required String number,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
  }) async {
    await firebaseAuthService.signIn(
      number: number,
      codeSent: codeSent,
      verificationFailed: verificationFailed,
    );
  }

  @override
  Future<UserCredential> submitOTP({
    required String otpCode,
    required String verificationId,
  }) async {
    return await firebaseAuthService.submitOTP(
      otpCode: otpCode,
      verificationId: verificationId,
    );
  }
}
