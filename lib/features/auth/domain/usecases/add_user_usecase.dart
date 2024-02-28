import 'package:messenger_task/features/auth/domain/repo/profile_repo.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class AddUserUsecase {
  final ProfileRepo phoneRepo;

  AddUserUsecase(this.phoneRepo);

  Future call(UserModel userModel) async {
    return await phoneRepo.addUser(userModel);
  }
}