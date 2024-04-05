import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger_task/core/utils/firebase_auth_service.dart';
import 'package:messenger_task/core/utils/firebase_firestore_service.dart';
import 'package:messenger_task/features/auth/repos/repo_impl/auth_repo_impl.dart';
import 'package:messenger_task/features/auth/repos/repo_impl/profile_repo_impl.dart';
import 'package:messenger_task/features/chat/repos/repo_impl/chat_repo_impl.dart';
import 'package:messenger_task/features/home/repos/repo_impl/home_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // firebase firestore service
  getIt.registerLazySingleton<FirebaseFireStoreService>(
    () => FirebaseFireStoreService(FirebaseFirestore.instance),
  );

  // firebase auth service
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(FirebaseAuth.instance),
  );

  // home repo impl
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt.get<FirebaseFireStoreService>()),
  );

  // chat repo impl
  getIt.registerLazySingleton<ChatRepoImpl>(
    () => ChatRepoImpl(getIt.get<FirebaseFireStoreService>()),
  );

  // auth repo impl
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(getIt.get<FirebaseAuthService>()),
  );

  // phone repo impl
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(getIt.get<FirebaseFireStoreService>()),
  );
}
