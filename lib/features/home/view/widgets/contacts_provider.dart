import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/home/repos/repo_impl/home_repo_impl.dart';
import 'package:messenger_task/features/home/view_model/cubit/get_all_contacts_cubit/get_all_contacts_cubit.dart';
import 'package:messenger_task/features/home/view/views/contacts_view.dart';

class ContactsProvider extends StatelessWidget {
  const ContactsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllContactsCubit(getIt.get<HomeRepoImpl>())
            ..getAllContacts(),
      child: const ContactsView(),
    );
  }
}
