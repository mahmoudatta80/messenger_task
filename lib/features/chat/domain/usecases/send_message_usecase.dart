import 'package:messenger_task/features/chat/data/model/message_model.dart';
import 'package:messenger_task/features/chat/domain/repo/chat_repo.dart';

class SendMessageUsecase {
  final ChatRepo chatRepo;

  SendMessageUsecase(this.chatRepo);

  Future call(MessageModel messageModel) async {
    return await chatRepo.sendMessage(messageModel);
  }
}
