import 'package:messenger_task/features/chat/data/model/message_model.dart';

abstract class GetAllMessagesState {}

class GetAllMessagesInitialState extends GetAllMessagesState {}
class GetAllMessagesLoadingState extends GetAllMessagesState {}
class GetAllMessagesSuccessState extends GetAllMessagesState {
  final List<MessageModel> messages;

  GetAllMessagesSuccessState(this.messages);
}
class GetAllMessagesFailureState extends GetAllMessagesState {
  final String errorMessage;

  GetAllMessagesFailureState(this.errorMessage);
}
