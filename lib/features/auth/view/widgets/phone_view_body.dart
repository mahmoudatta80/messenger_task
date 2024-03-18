import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/shared_preferences.dart';
import 'package:messenger_task/core/widgets/custom_button.dart';
import 'package:messenger_task/features/auth/view/widgets/build_phone_field.dart';
import 'package:messenger_task/features/auth/view_model/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:messenger_task/features/auth/view_model/cubit/sign_in_cubit/sign_in_state.dart';

class PhoneViewBody extends StatelessWidget {
  const PhoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(
                'Enter Your Phone Number',
                style: MyTextStyles.font24Weight700.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Please confirm your country code and enter your phone number',
                style: MyTextStyles.font14Weight400.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              const BuildPhoneField(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BlocConsumer<SignInCubit, SignInState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: () async {
                    if (context
                        .read<SignInCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<SignInCubit>().signIn(
                            context.read<SignInCubit>().phoneController.text,
                          );
                    }
                  },
                  requestLoading: context.read<SignInCubit>().requestLoading,
                  text: 'Continue',
                );
              },
              listener: (context, state) {
                if (state is SignInSuccessState) {
                  Constant.number =
                      context.read<SignInCubit>().phoneController.text;
                  MySharedPreferences.setString(
                    'number',
                    context.read<SignInCubit>().phoneController.text,
                  );
                  context.pushNamed(
                    Routes.code,
                    arguments: state.verificationId,
                  );
                } else if (state is SignInFailureState) {
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
            ),
          ),
        ),
      ],
    );
  }
}
