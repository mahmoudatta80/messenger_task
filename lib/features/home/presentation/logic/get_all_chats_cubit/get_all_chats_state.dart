import 'package:messenger_task/features/home/data/models/user_model.dart';

abstract class GetAllChatsState {}

class GetAllChatsInitialState extends GetAllChatsState {}

class GetAllChatsLoadingState extends GetAllChatsState {}

class GetAllChatsSuccessState extends GetAllChatsState {
  final List<UserModel> chats;

  GetAllChatsSuccessState(this.chats);
}

class GetAllChatsFailureState extends GetAllChatsState {
  final String errorMessage;

  GetAllChatsFailureState(this.errorMessage);
}
