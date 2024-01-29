import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/home/domain/usecases/get_suggestions_usecase.dart';

part 'get_suggestions_event.dart';
part 'get_suggestions_state.dart';

class GetSuggestionsBloc
    extends Bloc<GetSuggestionsEvent, GetSuggestionsState> {
  final GetUseCase _getSuggestionsUseCase;

  GetSuggestionsBloc(this._getSuggestionsUseCase)
      : super(GetSuggestionsInitial()) {
    on<GetSuggestions>(onGetSuggestions);
  }

  void onGetSuggestions(
      GetSuggestions event, Emitter<GetSuggestionsState> emit) async {
    emit(GetSuggestionsLoading());
    final dataState = await _getSuggestionsUseCase(params: null);
    if (dataState is DataSuccess) {
      emit(GetSuggestionsLoaded(dataState.data!));
    } else if (dataState is DataError) {
      print(dataState.error);
      emit(GetSuggestionsError(dataState.error!));
    }
  }
}
