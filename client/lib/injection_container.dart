import 'package:bitplus/app/data/datasources/habit_remote_data_source.dart';
import 'package:bitplus/app/data/datasources/life_area_remote_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_local_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_remote_data_source.dart';
import 'package:bitplus/app/data/repositories/habit_repository_impl.dart';
import 'package:bitplus/app/data/repositories/life_area_repository_impl.dart';
import 'package:bitplus/app/data/repositories/profile_repository_impl.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/app/domain/usecases/habit/check_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/create_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_list.dart';
import 'package:bitplus/app/domain/usecases/habit/uncheck_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/update_habit.dart';
import 'package:bitplus/app/domain/usecases/life_area/update_areas.dart';
import 'package:bitplus/app/domain/usecases/profile/get_user.dart';
import 'package:bitplus/app/domain/usecases/profile/is_signed_in_user.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_credentials.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_google.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_out.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_up_credentials.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_up_google.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/constants/parameters.dart';
import 'package:bitplus/core/network/network_info.dart';
import 'package:bitplus/core/services/area_value_algorithm.dart';
import 'package:bitplus/core/utils/login_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // Bloc
  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      getUser: serviceLocator() as GetUser,
      isSignedInUser: serviceLocator() as IsSignedInUser,
      signOut: serviceLocator() as SignOut,
    ),
  );

  serviceLocator.registerFactory<LoginCredentialsBloc>(
    () => LoginCredentialsBloc(
      loginValidator: serviceLocator() as LoginValidator,
    ),
  );

  serviceLocator.registerFactory<LoginBloc>(
    () => LoginBloc(
      authBloc: serviceLocator() as AuthBloc,
      signInCredentials: serviceLocator() as SignInCredentials,
      signInGoogle: serviceLocator() as SignInGoogle,
      signUpCredentials: serviceLocator() as SignUpCredentials,
      signUpGoogle: serviceLocator() as SignUpGoogle,
    ),
  );

  serviceLocator.registerFactory<InitLifeAreaBloc>(
    () => InitLifeAreaBloc(),
  );

  serviceLocator.registerLazySingleton<HabitListBloc>(
    () => HabitListBloc(
      authBloc: serviceLocator() as AuthBloc,
      checkHabit: serviceLocator() as CheckHabit,
      uncheckHabit: serviceLocator() as UncheckHabit,
    ),
  );

  serviceLocator.registerLazySingleton<HabitListStatusBloc>(
    () => HabitListStatusBloc(
      authBloc: serviceLocator() as AuthBloc,
      getHabitList: serviceLocator() as GetHabitList,
      habitListBloc: serviceLocator() as HabitListBloc,
    ),
  );

  serviceLocator.registerFactory<AreaOverviewBloc>(
    () => AreaOverviewBloc(
      authBloc: serviceLocator() as AuthBloc,
      habitListBloc: serviceLocator() as HabitListBloc,
      areaValueAlgorithm: serviceLocator() as AreaValueAlgorithm,
    ),
  );

  serviceLocator.registerFactory<UpdateLifeAreaStatusBloc>(
    () => UpdateLifeAreaStatusBloc(
      authBloc: serviceLocator() as AuthBloc,
      updateAreas: serviceLocator() as UpdateAreas,
    ),
  );

  serviceLocator.registerFactory<CreationHabitBloc>(
    () => CreationHabitBloc(),
  );

  serviceLocator.registerFactory<CreationHabitStatusBloc>(
    () => CreationHabitStatusBloc(
      authBloc: serviceLocator() as AuthBloc,
      createHabit: serviceLocator() as CreateHabit,
      updateHabit: serviceLocator() as UpdateHabit,
      habitListBloc: serviceLocator() as HabitListBloc,
    ),
  );

  // Repositories
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileLocalDataSource: serviceLocator() as ProfileLocalDataSource,
      profileRemoteDataSource: serviceLocator() as ProfileRemoteDataSource,
    ),
  );

  serviceLocator.registerLazySingleton<HabitRepository>(
    () => HabitRepositoryImpl(
      habitRemoteDataSource: serviceLocator() as HabitRemoteDataSource,
    ),
  );

  serviceLocator.registerLazySingleton<LifeAreaRepository>(
    () => LifeAreaRepositoryImpl(
      lifeAreaRemoteDataSource: serviceLocator() as LifeAreaRemoteDataSource,
    ),
  );

  // Usecases
  // Profile
  serviceLocator.registerLazySingleton(
    () => SignInCredentials(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignInGoogle(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignUpGoogle(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignUpCredentials(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => IsSignedInUser(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetUser(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignOut(
      profileRepository: serviceLocator() as ProfileRepository,
    ),
  );

  // Habit
  serviceLocator.registerLazySingleton(
    () => CheckHabit(
      habitRepository: serviceLocator() as HabitRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => CreateHabit(
      habitRepository: serviceLocator() as HabitRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UpdateHabit(
      habitRepository: serviceLocator() as HabitRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetHabitList(
      habitRepository: serviceLocator() as HabitRepository,
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UncheckHabit(
      habitRepository: serviceLocator() as HabitRepository,
    ),
  );

  // Life area
  serviceLocator.registerLazySingleton(
    () => UpdateAreas(
      lifeAreaRepository: serviceLocator() as LifeAreaRepository,
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      dataConnectionChecker: serviceLocator() as DataConnectionChecker,
    ),
  );

  serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      client: serviceLocator() as http.Client,
      firebaseAuth: serviceLocator() as FirebaseAuth,
      firestore: serviceLocator() as Firestore,
      googleSignIn: serviceLocator() as GoogleSignIn,
    ),
  );

  serviceLocator.registerLazySingleton<LifeAreaRemoteDataSource>(
    () => LifeAreaRemoteDataSourceImpl(
      client: serviceLocator() as http.Client,
    ),
  );

  serviceLocator.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<HabitRemoteDataSource>(
    () => HabitRemoteDataSourceImpl(
      client: serviceLocator() as http.Client,
      firestore: serviceLocator() as Firestore,
    ),
  );

  // Services
  serviceLocator.registerLazySingleton<LoginValidator>(
    () => LoginValidator(),
  );

  serviceLocator.registerLazySingleton<AreaValueAlgorithm>(
    () => ValueAlgorithmV1(
      DEFAULT_DATE_RANGE,
    ),
  );

  // External
  serviceLocator.registerLazySingleton(
    () => GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ),
  );

  serviceLocator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  serviceLocator.registerLazySingleton<Firestore>(
    () => Firestore.instance,
  );

  serviceLocator.registerLazySingleton<Crashlytics>(
    () => Crashlytics.instance,
  );

  serviceLocator.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  serviceLocator.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
}
