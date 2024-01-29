part of 'account_bloc.dart';

@immutable
sealed class AccountEvent extends Equatable {}

final class UploadProfileMedia extends AccountEvent {
  final MultipartFile file;
  UploadProfileMedia({required this.file});

  @override
  // TODO: implement props
  List<Object?> get props => [
        file,
      ];
}
