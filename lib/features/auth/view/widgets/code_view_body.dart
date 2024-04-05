import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/auth/view/widgets/custom_pin_code.dart';

class CodeViewBody extends StatelessWidget {
  final String verificationId;
  const CodeViewBody({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(
                'Enter Code',
                style: MyTextStyles.font24Weight700.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'We have sent you an SMS with the code to +20',
                style: MyTextStyles.font14Weight400.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              CustomPinCode(
                verificationId: verificationId,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                // context.pushNamed(Routes.profile);
              },
              child: Text(
                'Resend Code',
                style: MyTextStyles.font16Weight600.copyWith(
                  color: MyColors.buttonColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
