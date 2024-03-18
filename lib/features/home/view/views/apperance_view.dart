import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/styles/colors.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/home/view_model/cubit/apperance_cubit/apperance_cubit.dart';

class ApperanceView extends StatelessWidget {
  const ApperanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Apperance',
          style: MyTextStyles.font18Weight600.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Center(
          child: BlocBuilder<ApperanceCubit, ApperanceState>(
            builder: (context, state) => Switch(
              value: context.read<ApperanceCubit>().isLight,
              onChanged: (value) {
                context.read<ApperanceCubit>().changeTheme();
              },
              activeColor: MyColors.buttonColor,
              inactiveThumbColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
