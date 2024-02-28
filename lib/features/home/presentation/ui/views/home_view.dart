import 'package:flutter/material.dart';
import 'package:messenger_task/core/styles/text_styles.dart';
import 'package:messenger_task/features/home/presentation/ui/views/more_view.dart';
import 'package:messenger_task/features/home/presentation/ui/widgets/chats_provider.dart';
import 'package:messenger_task/features/home/presentation/ui/widgets/contacts_provider.dart';
import 'package:messenger_task/features/home/presentation/ui/widgets/custom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<String> titles = [
    'Contacts',
    'Chats',
    'More',
  ];
  List<Widget> screens = const [
    ContactsProvider(),
    ChatsProvider(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          titles[currentIndex],
          style: MyTextStyles.font18Weight600.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
