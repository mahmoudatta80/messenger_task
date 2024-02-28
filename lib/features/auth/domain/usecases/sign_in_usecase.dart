import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_task/features/auth/domain/repo/auth_repo.dart';

class SignInUsecase {
  final AuthRepo authRepo;

  SignInUsecase(this.authRepo);

  Future call({
    required String number,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
  }) async {
    return await authRepo.signIn(
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      number: number,
    );
  }
}
