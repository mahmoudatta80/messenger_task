import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/function/generate_country_flag.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/core/widgets/custom_form_field.dart';
import 'package:messenger_task/features/auth/presentation/logic/sign_in_cubit/sign_in_cubit.dart';

class BuildPhoneField extends StatelessWidget {
  const BuildPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              color: Theme.of(context).colorScheme.onSurface,
            ),
            child: Center(
              child: Text(
                '${generateCountryFlag(countryCode: 'eg')}  +20',
                style: MyTextStyles.font14Weight600.copyWith(
                  color: MyColors.formFieldTextStyleColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          flex: 4,
          child: Form(
            key: context.read<SignInCubit>().formKey,
            child: CustomFormField(
              text: 'Phone Number',
              textInputType: TextInputType.phone,
              controller: context.read<SignInCubit>().phoneController,
              validator: (value) {
                if (value == null || value.length != 10) {
                  return 'please enter valid number';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
