import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/interceptors/dio_interceptors.dart';
import 'package:mobile/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mobile/features/auth/data/repos/auth_repo_impl.dart';
import 'package:mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/login/login_bloc.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/register/register_bloc.dart';
import 'package:mobile/features/home/data/datasources/remote/users_remote_datasource.dart';
import 'package:mobile/features/home/data/repos/users_repo_impl.dart';
import 'package:mobile/features/home/domain/repos/users_repo.dart';
import 'package:mobile/features/home/domain/usecases/get_usecase.dart';
import 'package:mobile/features/home/presentation/blocs/remote/get_users/get_users_bloc.dart';
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

  // repository
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<UsersRepo>(
      () => UsersRepoImpl(remoteDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUseCase(repository: sl()));

  // Blocs
  // remote bloc
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => GetUsersBloc(sl()));
}
