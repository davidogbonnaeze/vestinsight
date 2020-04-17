import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vestinsight/features/login/presentation/bloc/bloc.dart';
import 'package:vestinsight/features/onboarding/domain/repositories/auth_service.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/features/signup/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerFactory(
    () => UserAuthBloc(),
  );
  sl.registerFactory(
    () => LoginBloc(),
  );
  sl.registerFactory(
    () => SignUpBloc(),
  );

  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => Firestore.instance);
}
