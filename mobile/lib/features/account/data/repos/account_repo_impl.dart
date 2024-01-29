import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/account/data/datasources/remote/account_remote_datasource.dart';
import 'package:mobile/features/account/domain/repos/account_repo.dart';

class AccountRepoImpl implements AccountRepo {
  final AccountRemoteDataSource remoteDataSource;

  AccountRepoImpl({required this.remoteDataSource});

  @override
  Future<DataState<void>> uploadMedia({required MultipartFile file}) async {
    try {
      final httpResponse = await remoteDataSource.upload(file);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
