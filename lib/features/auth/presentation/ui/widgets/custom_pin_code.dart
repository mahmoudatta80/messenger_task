import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/shared_preferences.dart';
import 'package:messenger_task/features/auth/presentation/logic/submit_otb_cubit/submit_otb_cubit.dart';
import 'package:messenger_task/features/auth/presentation/logic/submit_otb_cubit/submit_otb_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCode extends StatelessWidget {
  final String verificationId;

  const CustomPinCode({Key? key, required this.verificationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubmitOtbCubit, SubmitOTBState>(
      builder: (context, state) {
        return Form(
          key: context.read<SubmitOtbCubit>().formKey,
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            validator: (value) {
              if (value == null || value.length != 6) {
                return 'code is not valid';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            animationType: AnimationType.scale,
            controller: context.read<SubmitOtbCubit>().codeController,
            keyboardAppearance: Brightness.dark,
            textStyle: MyTextStyles.font18Weight600.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(14.r),
              borderWidth: 1,
              fieldHeight: MediaQuery.sizeOf(context).width * 0.1,
              fieldWidth: MediaQuery.sizeOf(context).width * 0.1,
              activeColor: MyColors.buttonColor,
              inactiveColor: MyColors.formFieldTextStyleColor,
              selectedColor: Theme.of(context).colorScheme.onPrimary,
            ),
            autoFocus: true,
            obscureText: false,
            animationDuration: const Duration(milliseconds: 300),
            onCompleted: (submittedCode) {
              if (context
                  .read<SubmitOtbCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<SubmitOtbCubit>().submitOTB(
                      otpCode: submittedCode,
                      verificationId: verificationId,
                    );
              }
            },
          ),
        );
      },
      listener: (context, state) {
        if (state is SubmitOTBSuccessState) {
          MySharedPreferences.setBool('userNotLogin', false);
          Constant.id = state.id;
          MySharedPreferences.setString('id', state.id);
          context.pushNamedAndRemoveUntil(
            Routes.profile,
            predicate: (route) => true,
          );
        } else if (state is SubmitOTBFailureState) {
          showBottomSheet(
            context: context,
            builder: (context) => Text(
              state.errorMessage,
              style: MyTextStyles.font18Weight600.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        }
      },
    );
  }
}
