part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  final UserEntity? user;
  final DioException? error;
  AuthState(this.user, this.error);

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  AuthInitial() : super(null, null);
}

final class LoginLoading extends AuthState {
  LoginLoading() : super(null, null);
}

final class LogedIn extends AuthState {
  LogedIn(UserEntity user) : super(user, null);
}

final class LoginError extends AuthState {
  LoginError(DioException error) : super(null, error);
}

final class RegisterLoading extends AuthState {
  RegisterLoading() : super(null, null);
}

final class Registred extends AuthState {
  Registred(UserEntity user) : super(user, null);
}

final class RegisterError extends AuthState {
  RegisterError(DioException error) : super(null, error);
}

final class LogoutLoading extends AuthState {
  LogoutLoading() : super(null, null);
}

final class LogedOut extends AuthState {
  LogedOut() : super(null, null);
}

final class LogoutError extends AuthState {
  LogoutError(DioException error) : super(null, error);
}
