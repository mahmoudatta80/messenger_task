import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/text_styles.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(Routes.account);
            },
            leading: Icon(
              Icons.person_outline_outlined,
              size: 20.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'Account',
              style: MyTextStyles.font14Weight600.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 20.sp,
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          ListTile(
            onTap: () {
              context.pushNamed(Routes.apperance);
            },
            leading: Icon(
              Icons.light_mode_outlined,
              size: 20.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'Appearance',
              style: MyTextStyles.font14Weight600.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
