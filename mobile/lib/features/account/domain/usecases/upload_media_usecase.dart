import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/account/domain/repos/account_repo.dart';
import 'package:mobile/features/home/domain/repos/matching_repo.dart';

class UploadMediaUseCase
    implements UseCase<DataState<void>, UploadMediaParams> {
  final AccountRepo repository;

  UploadMediaUseCase({required this.repository});

  @override
  Future<DataState<void>> call({required UploadMediaParams params}) async {
    return await repository.uploadMedia(file: params.file);
  }
}

class UploadMediaParams {
  final MultipartFile file;

  UploadMediaParams({required this.file});
}
