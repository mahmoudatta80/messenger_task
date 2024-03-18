import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/features/auth/repos/repo/profile_repo.dart';
import 'package:messenger_task/features/auth/view_model/cubit/add_user_cubit/add_user_state.dart';
import 'package:messenger_task/features/home/model/user_model.dart';

class AddUserCubit extends Cubit<AddUserState> {
  final ProfileRepo profileRepo;

  AddUserCubit(this.profileRepo) : super(AddUserInitialState());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool requestLoading = false;

  Future addUser(UserModel userModel) async {
    requestLoading = true;
    emit(AddUserLoadingState());
    try {
      await profileRepo.addUser(userModel);
      requestLoading = false;
      emit(AddUserSuccessState());
    } catch (error) {
      requestLoading = false;
      emit(AddUserFailureState(error.toString()));
    }
  }
}
