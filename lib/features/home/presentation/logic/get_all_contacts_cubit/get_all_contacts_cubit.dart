import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';
import 'package:messenger_task/features/home/domain/usecases/get_all_contacts_usecase.dart';
import 'package:messenger_task/features/home/presentation/logic/get_all_contacts_cubit/get_all_contacts_state.dart';

class GetAllContactsCubit extends Cubit<GetAllContactsState> {
  final GetAllContactsUsecase getAllContactsUsecase;

  GetAllContactsCubit(this.getAllContactsUsecase)
      : super(GetAllContactsInitialState());

  List<UserModel> contacts = [];

  getAllContacts() {
    emit(GetAllContactsLoadingState());

    if (isClosed) {
      return;
    }

    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> response =
          getAllContactsUsecase.call();

      response.listen((event) {
        contacts = [];
        for (var contact in event.docs) {
          if (Constant.id != contact.data()['id']) {
            contacts.add(UserModel.fromMap(contact.data()));
          }
        }
        emit(GetAllContactsSuccessState(contacts));
      });
    } catch (error) {
      emit(GetAllContactsFailureState(error.toString()));
    }
  }
}
