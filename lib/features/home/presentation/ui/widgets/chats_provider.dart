import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/home/domain/usecases/get_all_chats_usecase.dart';
import 'package:messenger_task/features/home/presentation/logic/get_all_chats_cubit/get_all_chats_cubit.dart';
import 'package:messenger_task/features/home/presentation/ui/views/chats_view.dart';

class ChatsProvider extends StatelessWidget {
  const ChatsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllChatsCubit(getIt.get<GetAllChatsUsecase>())
        ..getAllChats(Constant.id),
      child: const ChatsView(),
    );
  }
}
