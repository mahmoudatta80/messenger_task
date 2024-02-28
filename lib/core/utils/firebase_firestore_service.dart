import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/features/chat/data/model/message_model.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class FirebaseFireStoreService {
  final String users = 'users';
  final String chats = 'chats';
  final String messages = 'messages';
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFireStoreService(this._firebaseFirestore);

  Future addUser(UserModel userModel) async {
    await _firebaseFirestore
        .collection(users)
        .doc(userModel.id)
        .set(userModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContacts() {
    Stream<QuerySnapshot<Map<String, dynamic>>> response =
        _firebaseFirestore.collection(users).snapshots();
    return response;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChats(String id) {
    Stream<QuerySnapshot<Map<String, dynamic>>> response = _firebaseFirestore
        .collection(users)
        .doc(id)
        .collection(chats)
        .snapshots();
    return response;
  }

  Future sendMessage(MessageModel messageModel) async {
    await _firebaseFirestore
        .collection(users)
        .doc(messageModel.senderId)
        .collection(chats)
        .doc(messageModel.receiverId)
        .collection(messages)
        .add(messageModel.toMap());

    await _firebaseFirestore
        .collection(users)
        .doc(messageModel.receiverId)
        .collection(chats)
        .doc(messageModel.senderId)
        .collection(messages)
        .add(messageModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
    required String senderId,
    required String receiverId,
  }) {
    Stream<QuerySnapshot<Map<String, dynamic>>> response = _firebaseFirestore
        .collection(users)
        .doc(senderId)
        .collection(chats)
        .doc(receiverId)
        .collection(messages)
        .orderBy('date', descending: true)
        .snapshots();
    return response;
  }
}
