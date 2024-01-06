part of 'register_bloc.dart';

@immutable
sealed class RegisterState extends Equatable {
  final UserEntity? user;
  final DioException? error;
  RegisterState(this.user, this.error);

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {
  RegisterInitial() : super(null, null);
}

final class RegisterLoading extends RegisterState {
  RegisterLoading() : super(null, null);
}

final class LogedIn extends RegisterState {
  LogedIn(UserEntity user) : super(user, null);
}

final class RegisterError extends RegisterState {
  RegisterError(DioException error) : super(null, error);
}
