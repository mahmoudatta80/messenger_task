abstract class AddUserState {}

class AddUserInitialState extends AddUserState {}

class AddUserLoadingState extends AddUserState {}

class AddUserSuccessState extends AddUserState {}

class AddUserFailureState extends AddUserState {
  final String errorMessage;

  AddUserFailureState(this.errorMessage);
}
