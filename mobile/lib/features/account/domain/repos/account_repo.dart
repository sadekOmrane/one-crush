import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/network/data_state.dart';

abstract class AccountRepo {
  Future<DataState<void>> uploadMedia({
    required MultipartFile file,
  });
}
