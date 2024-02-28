import 'package:flutter/material.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/features/auth/presentation/ui/views/profile_view.dart';
import 'package:messenger_task/features/auth/presentation/ui/widgets/code_provider.dart';
import 'package:messenger_task/features/auth/presentation/ui/widgets/phone_provider.dart';
import 'package:messenger_task/features/auth/presentation/ui/widgets/profile_provider.dart';
import 'package:messenger_task/features/chat/presentation/ui/widgets/chat_provider.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';
import 'package:messenger_task/features/home/presentation/ui/views/account_view.dart';
import 'package:messenger_task/features/home/presentation/ui/views/apperance_view.dart';
import 'package:messenger_task/features/home/presentation/ui/views/home_view.dart';
import 'package:messenger_task/features/start/start_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.start:
        return MaterialPageRoute(
          builder: (context) => const StartView(),
        );
      case Routes.phone:
        return MaterialPageRoute(
          builder: (context) => const PhoneProvider(),
        );
      case Routes.code:
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => CodeProvider(
              verificationId: args,
            ),
          );
        }
        return null;
      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileProvider(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.account:
        return MaterialPageRoute(
          builder: (context) => const AccountView(),
        );
      case Routes.apperance:
        return MaterialPageRoute(
          builder: (context) => const ApperanceView(),
        );
      case Routes.chat:
        if (args is UserModel) {
          return MaterialPageRoute(
            builder: (context) => ChatProvider(
              userModel: args,
            ),
          );
        }
        return null;
    }
    return null;
  }
}
