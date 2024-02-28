import 'package:messenger_task/features/home/data/models/user_model.dart';

abstract class GetAllContactsState {}

class GetAllContactsInitialState extends GetAllContactsState {}

class GetAllContactsLoadingState extends GetAllContactsState {}

class GetAllContactsSuccessState extends GetAllContactsState {
  final List<UserModel> contacts;

  GetAllContactsSuccessState(this.contacts);
}

class GetAllContactsFailureState extends GetAllContactsState {
  final String errorMessage;

  GetAllContactsFailureState(this.errorMessage);
}
