import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/account/domain/usecases/upload_media_usecase.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final UploadMediaUseCase _uploadMediaUseCase;

  AccountBloc(this._uploadMediaUseCase) : super(AccountInitial()) {
    on<UploadProfileMedia>(onUploadProfileMedia);
  }

  void onUploadProfileMedia(
      UploadProfileMedia event, Emitter<AccountState> emit) async {
    emit(UploadProfileMediaLoading());
    final dataState =
        await _uploadMediaUseCase(params: UploadMediaParams(file: event.file));
    if (dataState is DataSuccess) {
      emit(ProfileMediaUploaded());
    } else if (dataState is DataError) {
      emit(UploadProfileMediaError(dataState.error!));
    }
  }
}
