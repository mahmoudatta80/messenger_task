import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/styles/text_styles.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                child: Icon(
                  Icons.person,
                  size: 50.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Icon(
                  Icons.add_circle_outlined,
                  size: 20.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'Mahmoud Atta',
            style: MyTextStyles.font24Weight700.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
