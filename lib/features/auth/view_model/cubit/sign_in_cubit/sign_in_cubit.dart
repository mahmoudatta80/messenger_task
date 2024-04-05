import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/auth/repos/repo/auth_repo.dart';
import 'package:messenger_task/features/auth/view_model/cubit/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;

  SignInCubit(this.authRepo) : super(SignInInitialState());

  TextEditingController phoneController = TextEditingController();
  bool requestLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signIn(String number) async {
    requestLoading = true;
    emit(SignInLoadingState());
    await authRepo.signIn(
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
