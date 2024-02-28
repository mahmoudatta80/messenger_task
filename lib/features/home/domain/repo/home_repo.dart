import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRepo {
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContacts();

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChats(String id);
}
