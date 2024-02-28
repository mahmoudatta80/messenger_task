import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/widgets/custom_form_field.dart';
import 'package:messenger_task/features/auth/presentation/logic/add_user_cubit/add_user_cubit.dart';
import 'package:messenger_task/features/auth/presentation/ui/widgets/custom_image_stack.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddUserCubit>().formKey,
      child: Column(
        children: [
          const CustomImageStack(),
          SizedBox(height: 30.h),
          CustomFormField(
            text: 'First Name (Required)',
            controller: context.read<AddUserCubit>().firstNameController,
          ),
          SizedBox(height: 10.h),
          CustomFormField(
            text: 'Last Name (Optional)',
            controller: context.read<AddUserCubit>().lastNameController,
          ),
        ],
      ),
    );
  }
}
