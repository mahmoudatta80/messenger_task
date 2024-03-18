import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/chat/model/message_model.dart';
import 'package:messenger_task/features/chat/repos/repo/chat_repo.dart';
import 'package:messenger_task/features/chat/view_model/cubit/get_all_messages_cubit/get_all_messages_state.dart';

class GetAllMessagesCubit extends Cubit<GetAllMessagesState> {
  final ChatRepo chatRepo;

  GetAllMessagesCubit(this.chatRepo)
      : super(GetAllMessagesInitialState());

  List<MessageModel> messages = [];

  getAllMessages({
    required String senderId,
    required String receiverId,
  }) {
    emit(GetAllMessagesLoadingState());

    if (isClosed) {
      return;
    }

    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> response =
          chatRepo.getAllMessages(
        senderId: senderId,
        receiverId: receiverId,
      );

      response.listen((event) {
        messages = [];
        for (var contact in event.docs) {
          messages.add(MessageModel.fromMap(contact.data()));
        }
        emit(GetAllMessagesSuccessState(messages));
      });
    } catch (error) {
      emit(GetAllMessagesFailureState(error.toString()));
    }
  }
}
