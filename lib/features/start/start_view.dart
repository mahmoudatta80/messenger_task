import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/start/widgets/terms_and_start_button.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Center(
                child: Image.asset(
                  height: MediaQuery.sizeOf(context).height * 0.3.h,
                  'assets/images/start.png',
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Connect easily with your family and friends over countries',
                style: MyTextStyles.font24Weight700.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const TermsAndStartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
