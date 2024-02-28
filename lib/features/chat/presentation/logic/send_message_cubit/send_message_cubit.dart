import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/chat/data/model/message_model.dart';
import 'package:messenger_task/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:messenger_task/features/chat/presentation/logic/send_message_cubit/send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final SendMessageUsecase sendMessageUsecase;

  SendMessageCubit(this.sendMessageUsecase) : super(SendMessageInitialState());

  TextEditingController textController = TextEditingController();

  sendMessages(MessageModel messageModel) async {
    if (isClosed) {
      return;
    }

    try {
      await sendMessageUsecase.call(messageModel);
      emit(SendMessageSuccessState());
    } catch (error) {
      emit(SendMessageFailureState(error.toString()));
    }
  }
}
