import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';
import 'package:messenger_task/features/home/domain/usecases/get_all_chats_usecase.dart';
import 'package:messenger_task/features/home/presentation/logic/get_all_chats_cubit/get_all_chats_state.dart';

class GetAllChatsCubit extends Cubit<GetAllChatsState> {
  final GetAllChatsUsecase getAllChatsUsecase;

  GetAllChatsCubit(this.getAllChatsUsecase) : super(GetAllChatsInitialState());

  List<UserModel> chats = [];

  getAllChats(String id) {
    emit(GetAllChatsLoadingState());

    if (isClosed) {
      return;
    }

    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> response =
          getAllChatsUsecase.call(id);

      response.listen((event) {
        chats = [];
        for (var contact in event.docs) {
          chats.add(UserModel.fromMap(contact.data()));
        }
        emit(GetAllChatsSuccessState(chats));
      });
    } catch (error) {
      emit(GetAllChatsFailureState(error.toString()));
    }
  }
}
