abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final String verificationId;

  SignInSuccessState(this.verificationId);
}

class SignInFailureState extends SignInState {
  final String errorMessage;

  SignInFailureState(this.errorMessage);
}
