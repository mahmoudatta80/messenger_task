import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/widgets/custom_form_field.dart';
import 'package:messenger_task/features/chat/model/message_model.dart';
import 'package:messenger_task/features/chat/view_model/cubit/send_message_cubit/send_message_cubit.dart';
import 'package:messenger_task/features/chat/view_model/cubit/send_message_cubit/send_message_state.dart';

class SendMessageBox extends StatelessWidget {
  final String receiverId;

  const SendMessageBox({super.key, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(15.sp),
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<SendMessageCubit, SendMessageState>(
        builder: (context, state) => Row(
          children: [
            Expanded(
              child: CustomFormField(
                text: 'send message...',
                controller: context.read<SendMessageCubit>().textController,
              ),
            ),
            SizedBox(width: 5.w),
            IconButton(
              onPressed: () {
                if (context.read<SendMessageCubit>().textController.text !=
                    '') {
                  MessageModel messageModel = MessageModel(
                    date:
                        DateFormat('hh:mm a').format(DateTime.now()).toString(),
                    senderId: Constant.id,
                    receiverId: receiverId,
                    text: context.read<SendMessageCubit>().textController.text,
                  );
                  context.read<SendMessageCubit>().sendMessages(messageModel);
                  context.read<SendMessageCubit>().textController.text = '';
                }
              },
              icon: Icon(
                Icons.send_outlined,
                color: MyColors.buttonColor,
                size: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
