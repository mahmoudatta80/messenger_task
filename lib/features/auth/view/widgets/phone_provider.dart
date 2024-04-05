import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/auth/repos/repo_impl/auth_repo_impl.dart';
import 'package:messenger_task/features/auth/view/views/phone_view.dart';
import 'package:messenger_task/features/auth/view_model/cubit/sign_in_cubit/sign_in_cubit.dart';

class PhoneProvider extends StatelessWidget {
  const PhoneProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepoImpl>()),
      child: const PhoneView(),
    );
  }
}
