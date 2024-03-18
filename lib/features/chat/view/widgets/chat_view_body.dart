import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/features/chat/view/widgets/build_my_message.dart';
import 'package:messenger_task/features/chat/view/widgets/build_other_message.dart';
import 'package:messenger_task/features/chat/view_model/cubit/get_all_messages_cubit/get_all_messages_cubit.dart';
import 'package:messenger_task/features/chat/view_model/cubit/get_all_messages_cubit/get_all_messages_state.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMessagesCubit, GetAllMessagesState>(
      builder: (context, state) {
        if (state is GetAllMessagesSuccessState) {
          if (state.messages.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.comment,
                  size: 32.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'There are no message',
                  style: MyTextStyles.font18Weight600.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            );
          }
          return ListView.builder(
            reverse: true,
            itemBuilder: (context, index) {
              return Constant.id == state.messages[index].senderId
                  ? BuildMyMessage(
                      messageModel: state.messages[index],
                    )
                  : BuildOtherMessage(
                      messageModel: state.messages[index],
                    );
            },
            itemCount: state.messages.length,
          );
        } else if (state is GetAllMessagesFailureState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: MyTextStyles.font18Weight600.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          );
        }
      },
    );
  }
}
