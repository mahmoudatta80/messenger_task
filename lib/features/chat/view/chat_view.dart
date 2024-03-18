import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/chat/view/widgets/chat_view_body.dart';
import 'package:messenger_task/features/chat/view/widgets/send_message_box.dart';
import 'package:messenger_task/features/home/model/user_model.dart';

class ChatView extends StatelessWidget {
  final UserModel userModel;

  const ChatView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20.sp,
          ),
        ),
        title: Text(
          userModel.name,
          style: MyTextStyles.font18Weight600.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const ChatViewBody(),
            ),
          ),
          SendMessageBox(receiverId: userModel.id),
        ],
      ),
    );
  }
}
