part of 'account_bloc.dart';

@immutable
sealed class AccountState extends Equatable {
  final DioException? error;
  AccountState(this.error);

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {
  AccountInitial() : super(null);
}

final class UploadProfileMediaLoading extends AccountState {
  UploadProfileMediaLoading() : super(null);
}

final class ProfileMediaUploaded extends AccountState {
  ProfileMediaUploaded() : super(null);
}

final class UploadProfileMediaError extends AccountState {
  UploadProfileMediaError(DioException error) : super(error);
}
