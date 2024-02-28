import 'package:messenger_task/core/utils/shared_preferences.dart';

abstract class Constant {
  static String id = MySharedPreferences.getString('id');
  static String number = MySharedPreferences.getString('number');
  static bool userNotLogin = MySharedPreferences.getBool('userNotLogin');
  static bool userNotAdded = MySharedPreferences.getBool('userNotAdded');
}
