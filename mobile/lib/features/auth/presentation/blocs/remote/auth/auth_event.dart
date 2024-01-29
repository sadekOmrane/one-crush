part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class Login extends AuthEvent {
  final String email;
  final String password;
  Login({
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

final class Register extends AuthEvent {
  final String name;
  final String email;
  final String password;
  Register({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password];
}

final class Logout extends AuthEvent {
  Logout();
}
