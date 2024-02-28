import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class ContactsListViewItem extends StatelessWidget {
  final UserModel userModel;
  const ContactsListViewItem({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(Routes.chat, arguments: userModel);
      },
      leading: Container(
        height: 52.h,
        width: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          userModel.image,
          height: 48.h,
          width: 48.h,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        userModel.name,
        style: MyTextStyles.font14Weight600.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      subtitle: Text(
        'online',
        style: MyTextStyles.font12Weight400.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
