import 'package:dio/dio.dart';
import 'package:mobile/core/constants/api_constants.dart';
import 'package:mobile/features/home/data/models/users_response.dart';
import 'package:retrofit/retrofit.dart';

part 'users_remote_datasource.g.dart';

@RestApi(baseUrl: APIConstants.BASE_URL)
abstract class UsersRemoteDataSource {
  factory UsersRemoteDataSource(Dio dio) = _UsersRemoteDataSource;

  @GET('/users/suggestions')
  Future<HttpResponse<UsersResponse>> get();
}
