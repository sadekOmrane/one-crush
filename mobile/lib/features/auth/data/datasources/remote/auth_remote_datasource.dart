import 'package:dio/dio.dart';
import 'package:mobile/core/constants/api_constants.dart';
import 'package:mobile/features/auth/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_datasource.g.dart';

@RestApi(baseUrl: APIConstants.BASE_URL)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/users/login')
  Future<HttpResponse<LoginResponse>> login({
    @Field('email') required String email,
    @Field('password') required String password,
  });

  @POST('/users/register')
  Future<HttpResponse<LoginResponse>> register({
    @Field('name') required String name,
    @Field('email') required String email,
    @Field('password') required String password,
  });
}
