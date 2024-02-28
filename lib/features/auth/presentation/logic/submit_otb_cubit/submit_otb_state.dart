abstract class SubmitOTBState {}

class SubmitOTBInitialState extends SubmitOTBState {}

class SubmitOTBLoadingState extends SubmitOTBState {}

class SubmitOTBSuccessState extends SubmitOTBState {
  final String id;

  SubmitOTBSuccessState(this.id);
}

class SubmitOTBFailureState extends SubmitOTBState {
  final String errorMessage;

  SubmitOTBFailureState(this.errorMessage);
}
