import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool? requestLoading;
  final String text;

  const CustomButton({
    super.key,
    this.onPressed,
    this.requestLoading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyColors.buttonColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size.fromHeight(52.h),
        ),
      ),
      child: requestLoading ?? false
          ? const CircularProgressIndicator(
            color: Colors.white,
          )
          : Text(
              text,
              style: MyTextStyles.font16Weight600.copyWith(
                color: Colors.white,
              ),
            ),
    );
  }
}
