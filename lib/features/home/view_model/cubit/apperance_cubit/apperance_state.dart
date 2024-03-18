part of 'apperance_cubit.dart';

@freezed
class ApperanceState with _$ApperanceState {
  const factory ApperanceState.initial() = _Initial;
  const factory ApperanceState.changeTheme(bool isLight) = _ChangeTheme;
}
