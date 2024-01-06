import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/auth/domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<Register>(onRegister);
  }

  void onRegister(Register event, Emitter<RegisterState> emit) async {
    final dataState = await _registerUseCase(
        params: RegisterParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess) {
      emit(LogedIn(dataState.data!));
    } else if (dataState is DataError) {
      print(dataState.error);
      emit(RegisterError(dataState.error!));
    }
  }
}
