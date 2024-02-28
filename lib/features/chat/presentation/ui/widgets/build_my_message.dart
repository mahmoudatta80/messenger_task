import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/chat/data/model/message_model.dart';

class BuildMyMessage extends StatelessWidget {
  final MessageModel messageModel;
  const BuildMyMessage({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(
          vertical: 10.h,
        ),
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 5.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          color: MyColors.buttonColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageModel.text,
              style: MyTextStyles.font14Weight400.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              messageModel.date,
              style: MyTextStyles.font12Weight400.copyWith(
                color: MyColors.formFieldTextStyleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
