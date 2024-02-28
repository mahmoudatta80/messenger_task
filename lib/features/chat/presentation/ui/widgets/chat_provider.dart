import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/chat/domain/usecases/get_all_messages_usecase.dart';
import 'package:messenger_task/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:messenger_task/features/chat/presentation/logic/get_all_messages_cubit/get_all_messages_cubit.dart';
import 'package:messenger_task/features/chat/presentation/logic/send_message_cubit/send_message_cubit.dart';
import 'package:messenger_task/features/chat/presentation/ui/chat_view.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class ChatProvider extends StatelessWidget {
  final UserModel userModel;

  const ChatProvider({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllMessagesCubit(getIt.get<GetAllMessagesUsecase>())
                ..getAllMessages(
                  senderId: Constant.id,
                  receiverId: userModel.id,
                ),
        ),
        BlocProvider(
          create: (context) =>
              SendMessageCubit(getIt.get<SendMessageUsecase>()),
        ),
      ],
      child: ChatView(userModel: userModel),
    );
  }
}
