import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger_task/core/utils/firebase_auth_service.dart';
import 'package:messenger_task/core/utils/firebase_firestore_service.dart';
import 'package:messenger_task/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:messenger_task/features/auth/data/repo_impl/profile_repo_impl.dart';
import 'package:messenger_task/features/auth/domain/usecases/add_user_usecase.dart';
import 'package:messenger_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:messenger_task/features/auth/domain/usecases/submit_otb_usecase.dart';
import 'package:messenger_task/features/chat/data/repo_impl/chat_repo_impl.dart';
import 'package:messenger_task/features/chat/domain/usecases/get_all_messages_usecase.dart';
import 'package:messenger_task/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:messenger_task/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:messenger_task/features/home/domain/usecases/get_all_chats_usecase.dart';
import 'package:messenger_task/features/home/domain/usecases/get_all_contacts_usecase.dart';

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

  // get all contacts use case
  getIt.registerLazySingleton<GetAllContactsUsecase>(
    () => GetAllContactsUsecase(getIt.get<HomeRepoImpl>()),
  );

  // get all chats use case
  getIt.registerLazySingleton<GetAllChatsUsecase>(
    () => GetAllChatsUsecase(getIt.get<HomeRepoImpl>()),
  );

  // get all messages use case
  getIt.registerLazySingleton<GetAllMessagesUsecase>(
    () => GetAllMessagesUsecase(getIt.get<ChatRepoImpl>()),
  );

  // send message use case
  getIt.registerLazySingleton<SendMessageUsecase>(
    () => SendMessageUsecase(getIt.get<ChatRepoImpl>()),
  );

  // sign in use case
  getIt.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(getIt.get<AuthRepoImpl>()),
  );

  // submit otb use case
  getIt.registerLazySingleton<SubmitOTBUsecase>(
    () => SubmitOTBUsecase(getIt.get<AuthRepoImpl>()),
  );

  // add user use case
  getIt.registerLazySingleton<AddUserUsecase>(
    () => AddUserUsecase(getIt.get<ProfileRepoImpl>()),
  );
}
