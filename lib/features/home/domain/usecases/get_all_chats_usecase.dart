import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_task/features/home/domain/repo/home_repo.dart';

class GetAllChatsUsecase {
  final HomeRepo homeRepo;

  GetAllChatsUsecase(this.homeRepo);

  Stream<QuerySnapshot<Map<String, dynamic>>> call(String id) {
    return homeRepo.getAllChats(id);
  }
}
