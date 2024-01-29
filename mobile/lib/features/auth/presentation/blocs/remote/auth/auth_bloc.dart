import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(this._loginUseCase, this._registerUseCase, this._logoutUseCase)
      : super(AuthInitial()) {
    on<Login>(onLogin);
    on<Register>(onRegister);
    on<Logout>(onLogout);
  }

  void onLogin(Login event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    final dataState = await _loginUseCase(
        params: LoginParams(
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess) {
      emit(LogedIn(dataState.data!));
    } else if (dataState is DataError) {
      emit(LoginError(dataState.error!));
    }
  }

  void onRegister(Register event, Emitter<AuthState> emit) async {
    emit(RegisterLoading());
    final dataState = await _registerUseCase(
        params: RegisterParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess) {
      emit(Registred(dataState.data!));
    } else if (dataState is DataError) {
      emit(RegisterError(dataState.error!));
    }
  }

  void onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(LogoutLoading());
    final dataState = await _logoutUseCase(params: null);

    if (dataState is DataSuccess) {
      emit(LogedOut());
    } else if (dataState is DataError) {
      emit(LogoutError(dataState.error!));
    }
  }
}
