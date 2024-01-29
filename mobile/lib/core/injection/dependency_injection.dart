import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/interceptors/dio_interceptors.dart';
import 'package:mobile/features/account/data/datasources/remote/account_remote_datasource.dart';
import 'package:mobile/features/account/data/repos/account_repo_impl.dart';
import 'package:mobile/features/account/domain/repos/account_repo.dart';
import 'package:mobile/features/account/domain/usecases/upload_media_usecase.dart';
import 'package:mobile/features/account/presentation/blocs/remote/account/account_bloc.dart';
import 'package:mobile/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mobile/features/auth/data/repos/auth_repo_impl.dart';
import 'package:mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/auth/auth_bloc.dart';
import 'package:mobile/features/home/data/datasources/remote/matching_remote_datasource.dart';
import 'package:mobile/features/home/data/datasources/remote/users_remote_datasource.dart';
import 'package:mobile/features/home/data/repos/matching_repo_impl.dart';
import 'package:mobile/features/home/data/repos/users_repo_impl.dart';
import 'package:mobile/features/home/domain/repos/matching_repo.dart';
import 'package:mobile/features/home/domain/repos/users_repo.dart';
import 'package:mobile/features/home/domain/usecases/get_suggestions_usecase.dart';
import 'package:mobile/features/home/domain/usecases/match_usecase.dart';
import 'package:mobile/features/home/presentation/blocs/remote/get_suggestions/get_suggestions_bloc.dart';
import 'package:mobile/features/home/presentation/blocs/remote/matching/matching_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initDepInjection() async {
  // Dio
  sl.registerLazySingleton<Dio>(() {
    Dio dio = Dio();
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  });

  //Dependencies
  // remote datasource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSource(sl()));
  sl.registerLazySingleton<MatchingRemoteDataSource>(
      () => MatchingRemoteDataSource(sl()));
  sl.registerLazySingleton<AccountRemoteDataSource>(
      () => AccountRemoteDataSource(sl()));

  // repository
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<UsersRepo>(
      () => UsersRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<MatchingRepo>(
      () => MatchingRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<AccountRepo>(
      () => AccountRepoImpl(remoteDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUseCase(repository: sl()));
  sl.registerLazySingleton(() => MatchUseCase(repository: sl()));
  sl.registerLazySingleton(() => UploadMediaUseCase(repository: sl()));

  // Blocs
  // remote bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory(() => GetSuggestionsBloc(sl()));
  sl.registerFactory(() => MatchingBloc(sl()));
  sl.registerFactory(() => AccountBloc(sl()));
}
