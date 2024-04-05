import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/core/utils/firebase_firestore_service.dart';
import 'package:messenger_task/features/chat/model/message_model.dart';
import 'package:messenger_task/features/chat/repos/repo/chat_repo.dart';

class ChatRepoImpl extends ChatRepo {
  final FirebaseFireStoreService firebaseFireStoreService;

  ChatRepoImpl(this.firebaseFireStoreService);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
    required String senderId,
    required String receiverId,
  }) {
    Stream<QuerySnapshot<Map<String, dynamic>>> response =
        firebaseFireStoreService.getAllMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
    return response;
  }

  @override
  Future sendMessage(MessageModel messageModel) async {
    Future response = await firebaseFireStoreService.sendMessage(messageModel);
    return response;
  }
}
