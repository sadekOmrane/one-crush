part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  final UserEntity? user;
  final DioException? error;
  LoginState(this.user, this.error);

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(null, null);
}

final class LoginLoading extends LoginState {
  LoginLoading() : super(null, null);
}

final class LogedIn extends LoginState {
  LogedIn(UserEntity user) : super(user, null);
}

final class LoginError extends LoginState {
  LoginError(DioException error) : super(null, error);
}
