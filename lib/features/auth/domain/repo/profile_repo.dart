import 'package:messenger_task/features/home/data/models/user_model.dart';

abstract class ProfileRepo {
  Future addUser(UserModel userModel);
}