import 'package:messenger_task/features/home/model/user_model.dart';

abstract class ProfileRepo {
  Future addUser(UserModel userModel);
}