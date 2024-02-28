import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/auth/domain/usecases/submit_otb_usecase.dart';
import 'package:messenger_task/features/auth/presentation/logic/submit_otb_cubit/submit_otb_cubit.dart';
import 'package:messenger_task/features/auth/presentation/ui/views/code_view.dart';

class CodeProvider extends StatelessWidget {
  final String verificationId;
  const CodeProvider({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitOtbCubit(getIt.get<SubmitOTBUsecase>()),
      child: CodeView(
        verificationId: verificationId,
      ),
    );
  }
}
