import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/home/data/datasources/remote/users_remote_datasource.dart';
import 'package:mobile/features/home/domain/repos/users_repo.dart';

class UsersRepoImpl implements UsersRepo {
  final UsersRemoteDataSource remoteDataSource;

  UsersRepoImpl({required this.remoteDataSource});

  @override
  Future<DataState<List<UserEntity>>> suggestions() async {
    // TODO: implement get
    try {
      final httpResponse = await remoteDataSource.get();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
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
