import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/auth/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<Login>(onLogin);
  }

  void onLogin(Login event, Emitter<LoginState> emit) async {
    final dataState = await _loginUseCase(
        params: LoginParams(
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess) {
      emit(LogedIn(dataState.data!));
    } else if (dataState is DataError) {
      print(dataState.error);
      emit(LoginError(dataState.error!));
    }
  }
}
