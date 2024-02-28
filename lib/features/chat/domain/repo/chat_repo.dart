import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/features/chat/data/model/message_model.dart';

abstract class ChatRepo {
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
    required String senderId,
    required String receiverId,
  });

  Future sendMessage(MessageModel messageModel);
}
