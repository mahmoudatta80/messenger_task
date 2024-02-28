import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/features/chat/domain/repo/chat_repo.dart';

class GetAllMessagesUsecase {
  final ChatRepo chatRepo;

  GetAllMessagesUsecase(this.chatRepo);

  Stream<QuerySnapshot<Map<String, dynamic>>> call({
    required String senderId,
    required String receiverId,
  }) {
    return chatRepo.getAllMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
  }
}
