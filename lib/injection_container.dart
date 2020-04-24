import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/core/services/storage_service.dart';
import 'package:vestinsight/features/home/presentation/blocs/add_investment/add_investment_bloc.dart';
import 'package:vestinsight/features/home/presentation/blocs/edit_profile/bloc.dart';
import 'package:vestinsight/features/login/presentation/bloc/bloc.dart';
import 'package:vestinsight/core/services/auth_service.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/features/signup/presentation/bloc/bloc.dart';

import 'features/home/domain/entities/broker.dart';

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
  sl.registerFactory(
    () => EditProfileBloc(),
  );

  sl.registerFactory(
    () => AddInvestmentBloc(),
  );

  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => DataBaseService());
  sl.registerLazySingleton(() => StorageService());
  sl.registerLazySingleton(() => Firestore.instance);
  sl.registerLazySingleton(() => FirebaseStorage.instance);
  final List<Broker> brokers = await DataBaseService.getBrokers();
  sl.registerLazySingleton(() => brokers);
}
