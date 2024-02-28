import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/auth/domain/usecases/add_user_usecase.dart';
import 'package:messenger_task/features/auth/presentation/logic/add_user_cubit/add_user_cubit.dart';
import 'package:messenger_task/features/auth/presentation/ui/views/profile_view.dart';

class ProfileProvider extends StatelessWidget {
  const ProfileProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUserCubit(getIt.get<AddUserUsecase>()),
      child: const ProfileView(),
    );
  }
}
