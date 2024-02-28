import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/auth/domain/usecases/add_user_usecase.dart';
import 'package:messenger_task/features/auth/presentation/logic/add_user_cubit/add_user_state.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class AddUserCubit extends Cubit<AddUserState> {
  final AddUserUsecase addUserUsecase;

  AddUserCubit(this.addUserUsecase) : super(AddUserInitialState());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool requestLoading = false;

  Future addUser(UserModel userModel) async {
    requestLoading = true;
    emit(AddUserLoadingState());
    try {
      await addUserUsecase.call(userModel);
      requestLoading = false;
      emit(AddUserSuccessState());
    } catch (error) {
      requestLoading = false;
      emit(AddUserFailureState(error.toString()));
    }
  }
}
