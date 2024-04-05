import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/chat/model/message_model.dart';

class BuildOtherMessage extends StatelessWidget {
  final MessageModel messageModel;
  const BuildOtherMessage({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(
        vertical: 10.h,
      ),
      padding: EdgeInsetsDirectional.symmetric(
        vertical: 5.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            messageModel.text,
            style: MyTextStyles.font14Weight400.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            intl.DateFormat('hh:mm a').format(intl.DateFormat().parse(messageModel.date)).toString(),
            style: MyTextStyles.font12Weight400.copyWith(
              color: MyColors.formFieldTextStyleColor,
            ),
          ),
        ],
      ),
    );
  }
}
