abstract class SendMessageState {}

class SendMessageInitialState extends SendMessageState {}

class SendMessageLoadingState extends SendMessageState {}

class SendMessageSuccessState extends SendMessageState {}

class SendMessageFailureState extends SendMessageState {
  final String errorMessage;

  SendMessageFailureState(this.errorMessage);
}
