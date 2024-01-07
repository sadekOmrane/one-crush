import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/home/domain/usecases/get_usecase.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final GetUseCase _getUseCase;

  GetUsersBloc(this._getUseCase) : super(GetUsersInitial()) {
    on<GetUsers>(onGetUsers);
  }

  void onGetUsers(GetUsers event, Emitter<GetUsersState> emit) async {
    emit(GetUsersLoading());
    final dataState = await _getUseCase(params: null);
    if (dataState is DataSuccess) {
      emit(GetUsersLoaded(dataState.data!));
    } else if (dataState is DataError) {
      print(dataState.error);
      emit(GetUsersError(dataState.error!));
    }
  }
}
