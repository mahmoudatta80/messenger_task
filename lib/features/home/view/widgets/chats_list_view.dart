import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/home/view_model/cubit/get_all_chats_cubit/get_all_chats_cubit.dart';
import 'package:messenger_task/features/home/view/widgets/chats_list_view_item.dart';
import 'package:messenger_task/features/home/view_model/cubit/get_all_chats_cubit/get_all_chats_state.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllChatsCubit, GetAllChatsState>(
      builder: (context, state) {
        if (state is GetAllChatsSuccessState) {
          return state.chats.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.comment,
                      size: 32.sp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'There are no chat',
                      style: MyTextStyles.font18Weight600.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ChatsListViewItem(
                    userModel: state.chats[index],
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  itemCount: state.chats.length,
                );
        } else if (state is GetAllChatsFailureState) {
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
