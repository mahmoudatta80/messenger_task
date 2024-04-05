import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/core/utils/firebase_firestore_service.dart';
import 'package:messenger_task/features/home/repos/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final FirebaseFireStoreService firebaseFireStoreService;

  HomeRepoImpl(this.firebaseFireStoreService);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContacts() {
    Stream<QuerySnapshot<Map<String, dynamic>>> response =
        firebaseFireStoreService.getAllContacts();
    return response;
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChats(String id) {
    Stream<QuerySnapshot<Map<String, dynamic>>> response =
        firebaseFireStoreService.getAllChats(id);
    return response;
  }
}
