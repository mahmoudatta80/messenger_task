import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:messenger_task/features/auth/presentation/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:messenger_task/features/auth/presentation/ui/views/phone_view.dart';

class PhoneProvider extends StatelessWidget {
  const PhoneProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<SignInUsecase>()),
      child: const PhoneView(),
    );
  }
}
