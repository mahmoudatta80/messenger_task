import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/auth/repos/repo/auth_repo.dart';
import 'package:messenger_task/features/auth/view_model/cubit/submit_otb_cubit/submit_otb_state.dart';

class SubmitOtbCubit extends Cubit<SubmitOTBState> {
  final AuthRepo authRepo;

  SubmitOtbCubit(this.authRepo) : super(SubmitOTBInitialState());

  TextEditingController codeController = TextEditingController();
  bool requestLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future submitOTB(
      {required String otpCode, required String verificationId}) async {
    emit(SubmitOTBLoadingState());
    try {
      UserCredential userCredential = await authRepo.submitOTP(
        otpCode: otpCode,
        verificationId: verificationId,
      );
      emit(SubmitOTBSuccessState(userCredential.user!.uid));
    } catch (error) {
      emit(SubmitOTBFailureState(error.toString()));
    }
  }
}
