import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/home/data/datasources/remote/matching_remote_datasource.dart';
import 'package:mobile/features/home/domain/repos/matching_repo.dart';

class MatchingRepoImpl implements MatchingRepo {
  final MatchingRemoteDataSource remoteDataSource;

  MatchingRepoImpl({required this.remoteDataSource});

  @override
  Future<DataState<void>> match({required int id, required String type}) async {
    // TODO: implement get
    try {
      final httpResponse = await remoteDataSource.match(id, type);

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
