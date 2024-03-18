import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_task/core/styles/text_styles.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 30,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          activeIcon: Column(
            children: [
              Text(
                'Contacts',
                style: MyTextStyles.font14Weight600.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 5.h),
              CircleAvatar(
                radius: 3.r,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
          icon: Icon(
            Icons.people_alt_outlined,
            size: 32.sp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          activeIcon: Column(
            children: [
              Text(
                'Chats',
                style: MyTextStyles.font14Weight600.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 5.h),
              CircleAvatar(
                radius: 3.r,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
          icon: FaIcon(
            FontAwesomeIcons.comment,
            size: 32.sp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          activeIcon: Column(
            children: [
              Text(
                'More',
                style: MyTextStyles.font14Weight600.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 5.h),
              CircleAvatar(
                radius: 3.r,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
          icon: FaIcon(
            FontAwesomeIcons.ellipsis,
            size: 32.sp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'More',
        ),
      ],
    );
  }
}
