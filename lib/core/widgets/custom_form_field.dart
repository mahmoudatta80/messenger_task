import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  const CustomFormField({
    super.key,
    required this.text,
    this.icon,
    required this.controller,
    this.validator,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInputType ?? TextInputType.text,
        style: MyTextStyles.font14Weight600.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide.none,
          ),
          hintText: text,
          hintStyle: MyTextStyles.font14Weight600.copyWith(
            color: MyColors.formFieldTextStyleColor,
          ),
          prefixIcon: Icon(
            icon,
            size: icon == null ? 0 : 24.sp,
            color: MyColors.formFieldTextStyleColor,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
