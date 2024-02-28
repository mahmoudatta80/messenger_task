import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/shared_preferences.dart';
import 'package:messenger_task/core/widgets/custom_button.dart';
import 'package:messenger_task/core/widgets/custom_form_field.dart';
import 'package:messenger_task/features/auth/presentation/logic/add_user_cubit/add_user_cubit.dart';
import 'package:messenger_task/features/auth/presentation/logic/add_user_cubit/add_user_state.dart';
import 'package:messenger_task/features/auth/presentation/ui/widgets/custom_profile_info.dart';
import 'package:messenger_task/features/home/data/models/user_model.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: CustomProfileInfo(),
        ),
        SliverFillRemaining(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BlocConsumer<AddUserCubit, AddUserState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    UserModel userModel = UserModel(
                      number: Constant.number,
                      name:
                          '${context.read<AddUserCubit>().firstNameController.text} ${context.read<AddUserCubit>().lastNameController.text}',
                      image:
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600',
                      id: Constant.id,
                    );
                    context.read<AddUserCubit>().addUser(userModel);
                  },
                  requestLoading: context.read<AddUserCubit>().requestLoading,
                  text: 'Save',
                );
              },
              listener: (context, state) {
                if (state is AddUserSuccessState) {
                  MySharedPreferences.setBool('userNotAdded', false);
                  context.pushNamedAndRemoveUntil(
                    Routes.home,
                    predicate: (route) => true,
                  );
                } else if (state is AddUserFailureState) {
                  showBottomSheet(
                    context: context,
                    builder: (context) => Text(
                      state.errorMessage,
                      style: MyTextStyles.font18Weight600.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
