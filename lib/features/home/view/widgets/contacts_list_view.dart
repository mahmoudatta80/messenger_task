import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/home/view_model/cubit/get_all_contacts_cubit/get_all_contacts_cubit.dart';
import 'package:messenger_task/features/home/view_model/cubit/get_all_contacts_cubit/get_all_contacts_state.dart';
import 'package:messenger_task/features/home/view/widgets/contacts_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllContactsCubit, GetAllContactsState>(
      builder: (context, state) {
        if (state is GetAllContactsSuccessState) {
          return state.contacts.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      size: 32.sp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'There are no contacts',
                      style: MyTextStyles.font18Weight600.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ContactsListViewItem(
                    userModel: state.contacts[index],
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  itemCount: state.contacts.length,
                );
        } else if (state is GetAllContactsFailureState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: MyTextStyles.font18Weight600.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          );
        }
      },
    );
  }
}
