import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'account_remote_datasource.g.dart';

@RestApi(baseUrl: APIConstants.BASE_URL)
abstract class AccountRemoteDataSource {
  factory AccountRemoteDataSource(Dio dio) = _AccountRemoteDataSource;

  @POST('/medias')
  Future<HttpResponse<void>> upload(@Field('file') MultipartFile type);
}
