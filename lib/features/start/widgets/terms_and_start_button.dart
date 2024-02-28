import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/core/widgets/custom_button.dart';

class TermsAndStartButton extends StatelessWidget {
  const TermsAndStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Terms & Privacy Policy',
          style: MyTextStyles.font14Weight600.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        SizedBox(height: 20.h),
        CustomButton(
          onPressed: () {
            context.pushNamed(Routes.phone);
          },
          text: 'Start Messaging',
        ),
      ],
    );
  }
}
