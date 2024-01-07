import 'package:dio/dio.dart';
import 'package:mobile/core/constants/api_constants.dart';
import 'package:mobile/features/home/data/models/matching_response.dart';
import 'package:retrofit/retrofit.dart';

part 'matching_remote_datasource.g.dart';

@RestApi(baseUrl: APIConstants.BASE_URL)
abstract class MatchingRemoteDataSource {
  factory MatchingRemoteDataSource(Dio dio) = _MatchingRemoteDataSource;

  @POST('/matchings/{id}')
  Future<HttpResponse<MatchingResponse>> match(
      @Path('id') int id, @Field('type') String type);
}
