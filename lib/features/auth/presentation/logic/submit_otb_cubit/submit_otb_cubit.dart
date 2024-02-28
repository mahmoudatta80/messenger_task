import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/auth/domain/usecases/submit_otb_usecase.dart';
import 'package:messenger_task/features/auth/presentation/logic/submit_otb_cubit/submit_otb_state.dart';

class SubmitOtbCubit extends Cubit<SubmitOTBState> {
  final SubmitOTBUsecase submitOTBUsecase;
  SubmitOtbCubit(this.submitOTBUsecase) : super(SubmitOTBInitialState());

  TextEditingController codeController = TextEditingController();
  bool requestLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future submitOTB({required String otpCode, required String verificationId}) async {
    emit(SubmitOTBLoadingState());
    try {
      UserCredential userCredential = await submitOTBUsecase.call(
        otpCode: otpCode,
        verificationId: verificationId,
      );
      emit(SubmitOTBSuccessState(userCredential.user!.uid));
    } catch (error) {
      emit(SubmitOTBFailureState(error.toString()));
    }
  }
}
