import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mobile/features/auth/data/datasources/secure_storage.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<DataState<UserEntity>> login(
      {required String email, required String password}) async {
    // TODO: implement login
    try {
      final httpResponse =
          await remoteDataSource.login(email: email, password: password);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        SecureStorage.setToken(httpResponse.data.data.authorisation.token);
        SecureStorage.setUser(httpResponse.data.data.user);
        return DataSuccess(httpResponse.data.data.user);
      } else {
        return DataError(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.data,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState<UserEntity>> register(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: implement register
    try {
      final httpResponse = await remoteDataSource.register(
          name: name, email: email, password: password);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        SecureStorage.setToken(httpResponse.data.data.authorisation.token);
        SecureStorage.setUser(httpResponse.data.data.user);
        return DataSuccess(httpResponse.data.data.user);
      } else {
        return DataError(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.data,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState<void>> logout() async {
    // TODO: implement logout
    try {
      final httpResponse = await remoteDataSource.logout();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        SecureStorage.removeToken();
        SecureStorage.removeUser();
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.data,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
