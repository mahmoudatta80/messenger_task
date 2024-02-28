import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_task/features/auth/domain/repo/auth_repo.dart';

class SubmitOTBUsecase {
  final AuthRepo authRepo;

  SubmitOTBUsecase(this.authRepo);

  Future<UserCredential> call({
    required String otpCode,
    required String verificationId,
  }) async {
    return await authRepo.submitOTP(
      otpCode: otpCode,
      verificationId: verificationId,
    );
  }
}
