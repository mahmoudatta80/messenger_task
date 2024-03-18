import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/auth/repos/repo_impl/profile_repo_impl.dart';
import 'package:messenger_task/features/auth/view/views/profile_view.dart';
import 'package:messenger_task/features/auth/view_model/cubit/add_user_cubit/add_user_cubit.dart';

class ProfileProvider extends StatelessWidget {
  const ProfileProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUserCubit(getIt.get<ProfileRepoImpl>()),
      child: const ProfileView(),
    );
  }
}
