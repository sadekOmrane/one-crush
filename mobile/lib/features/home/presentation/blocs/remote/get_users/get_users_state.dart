part of 'get_users_bloc.dart';

@immutable
sealed class GetUsersState extends Equatable {
  final List<UserEntity>? users;
  final DioException? error;
  GetUsersState(this.users, this.error);

  @override
  List<Object> get props => [];
}

final class GetUsersInitial extends GetUsersState {
  GetUsersInitial() : super(null, null);
}

final class GetUsersLoading extends GetUsersState {
  GetUsersLoading() : super(null, null);
}

final class GetUsersLoaded extends GetUsersState {
  GetUsersLoaded(List<UserEntity> users) : super(users, null);
}

final class GetUsersError extends GetUsersState {
  GetUsersError(DioException error) : super(null, error);
}
