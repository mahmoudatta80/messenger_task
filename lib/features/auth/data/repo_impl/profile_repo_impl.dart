import 'package:messenger_task/core/utils/firebase_firestore_service.dart';
import 'package:messenger_task/features/auth/domain/repo/profile_repo.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class ProfileRepoImpl extends ProfileRepo {
  final FirebaseFireStoreService firebaseFireStoreService;

  ProfileRepoImpl(this.firebaseFireStoreService);

  @override
  Future addUser(UserModel userModel) async {
    await firebaseFireStoreService.addUser(userModel);
  }
}
