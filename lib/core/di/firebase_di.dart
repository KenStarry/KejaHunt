import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:keja_hunt/core/data/repository/firebase_repository.dart';

void setupFirebaseDI(GetIt locator) {
  locator.registerLazySingleton<FirebaseMessaging>(
    () => FirebaseMessaging.instance,
  );
  locator.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());
}
