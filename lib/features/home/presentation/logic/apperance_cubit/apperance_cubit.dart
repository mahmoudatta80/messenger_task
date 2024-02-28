import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_task/core/utils/shared_preferences.dart';

part 'apperance_state.dart';

part 'apperance_cubit.freezed.dart';

class ApperanceCubit extends Cubit<ApperanceState> {
  ApperanceCubit() : super(const ApperanceState.initial());

  bool isLight = MySharedPreferences.getBool('isLight');

  changeTheme() {
    isLight = !isLight;
    MySharedPreferences.setBool('isLight', isLight);
    emit(ApperanceState.changeTheme(isLight));
  }
}
