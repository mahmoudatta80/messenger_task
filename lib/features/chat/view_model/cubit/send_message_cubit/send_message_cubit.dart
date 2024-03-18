import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/chat/model/message_model.dart';
import 'package:messenger_task/features/chat/repos/repo/chat_repo.dart';
import 'package:messenger_task/features/chat/view_model/cubit/send_message_cubit/send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final ChatRepo chatRepo;

  SendMessageCubit(this.chatRepo) : super(SendMessageInitialState());

  TextEditingController textController = TextEditingController();

  sendMessages(MessageModel messageModel) async {
    if (isClosed) {
      return;
    }

    try {
      await chatRepo.sendMessage(messageModel);
      emit(SendMessageSuccessState());
    } catch (error) {
      emit(SendMessageFailureState(error.toString()));
    }
  }
}
