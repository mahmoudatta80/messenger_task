import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/features/home/domain/usecases/get_all_contacts_usecase.dart';
import 'package:messenger_task/features/home/presentation/logic/get_all_contacts_cubit/get_all_contacts_cubit.dart';
import 'package:messenger_task/features/home/presentation/ui/views/contacts_view.dart';

class ContactsProvider extends StatelessWidget {
  const ContactsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllContactsCubit(getIt.get<GetAllContactsUsecase>())
            ..getAllContacts(),
      child: const ContactsView(),
    );
  }
}
