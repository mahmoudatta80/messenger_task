import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_task/core/routes/app_router.dart';
import 'package:messenger_task/core/routes/routes.dart';
import 'package:messenger_task/core/styles/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/utils/constant.dart';
import 'package:messenger_task/core/utils/dependency_injection.dart';
import 'package:messenger_task/core/utils/shared_preferences.dart';
import 'package:messenger_task/features/home/view_model/cubit/apperance_cubit/apperance_cubit.dart';
import 'package:messenger_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await MySharedPreferences.init();
  await setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => ApperanceCubit(),
        child: BlocBuilder<ApperanceCubit, ApperanceState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.read<ApperanceCubit>().isLight
                ? MyThemes.lightTheme
                : MyThemes.darkTheme,
            initialRoute: Constant.userNotAdded
                ? Constant.userNotLogin
                    ? Routes.start
                    : Routes.profile
                : Routes.home,
            onGenerateRoute: appRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}
