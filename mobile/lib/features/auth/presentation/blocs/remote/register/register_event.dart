part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent extends Equatable {}

final class Register extends RegisterEvent {
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
