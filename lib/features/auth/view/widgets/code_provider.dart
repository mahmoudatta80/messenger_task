import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/auth/repos/repo_impl/auth_repo_impl.dart';
import 'package:messenger_task/features/auth/view/views/code_view.dart';
import 'package:messenger_task/features/auth/view_model/cubit/submit_otb_cubit/submit_otb_cubit.dart';

class CodeProvider extends StatelessWidget {
  final String verificationId;
  const CodeProvider({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitOtbCubit(getIt.get<AuthRepoImpl>()),
      child: CodeView(
        verificationId: verificationId,
      ),
    );
  }
}
