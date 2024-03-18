import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/chat/repos/repo_impl/chat_repo_impl.dart';
import 'package:messenger_task/features/chat/view/chat_view.dart';
import 'package:messenger_task/features/chat/view_model/cubit/get_all_messages_cubit/get_all_messages_cubit.dart';
import 'package:messenger_task/features/chat/view_model/cubit/send_message_cubit/send_message_cubit.dart';
import 'package:messenger_task/features/home/model/user_model.dart';

class ChatProvider extends StatelessWidget {
  final UserModel userModel;

  const ChatProvider({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllMessagesCubit(getIt.get<ChatRepoImpl>())
                ..getAllMessages(
                  senderId: Constant.id,
                  receiverId: userModel.id,
                ),
        ),
        BlocProvider(
          create: (context) =>
              SendMessageCubit(getIt.get<ChatRepoImpl>()),
        ),
      ],
      child: ChatView(userModel: userModel),
    );
  }
}
