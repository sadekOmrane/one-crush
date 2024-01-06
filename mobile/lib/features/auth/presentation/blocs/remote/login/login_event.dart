part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {}

final class Login extends LoginEvent {
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
