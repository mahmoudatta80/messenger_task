import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';
import 'package:messenger_task/features/home/domain/repo/home_repo.dart';

class GetAllContactsUsecase {
  final HomeRepo homeRepo;

  GetAllContactsUsecase(this.homeRepo);

  Stream<QuerySnapshot<Map<String, dynamic>>> call() {
    return homeRepo.getAllContacts();
  }
}
