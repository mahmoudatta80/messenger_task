import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/widgets/custom_form_field.dart';
import 'package:messenger_task/features/home/view/widgets/contacts_list_view.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        children: [
          CustomFormField(
            text: 'Search',
            controller: TextEditingController(),
            icon: Icons.search_outlined,
          ),
          SizedBox(height: 20.h),
          const Expanded(
            child: ContactsListView(),
          ),
        ],
      ),
    );
  }
}
