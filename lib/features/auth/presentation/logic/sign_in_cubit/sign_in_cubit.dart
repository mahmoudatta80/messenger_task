import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:messenger_task/features/auth/presentation/logic/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase signInUsecase;

  SignInCubit(this.signInUsecase) : super(SignInInitialState());

  TextEditingController phoneController = TextEditingController();
  bool requestLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signIn(String number) async {
    requestLoading = true;
    emit(SignInLoadingState());
    await signInUsecase.call(
      codeSent: (verificationId, resendToken) {
        requestLoading = false;
        emit(SignInSuccessState(verificationId));
      },
      verificationFailed: (error) {
        requestLoading = false;
        if (error.code == 'invalid-phone-number') {
          emit(SignInFailureState('The provided phone number is not valid.'));
        }
        emit(SignInFailureState(error.toString()));
      },
      number: number,
    );
  }
}
