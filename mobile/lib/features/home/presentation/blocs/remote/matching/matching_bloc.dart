import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/home/domain/usecases/match_usecase.dart';

part 'matching_event.dart';
part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  final MatchUseCase _matchUseCase;

  MatchingBloc(this._matchUseCase) : super(MatchingInitial()) {
    on<Match>(onMatch);
  }

  void onMatch(Match event, Emitter<MatchingState> emit) async {
    emit(MatchLoading());
    final dataState = await _matchUseCase(
        params: MatchParams(id: event.id, type: event.type));
    if (dataState is DataSuccess) {
      emit(MatchLoaded());
    } else if (dataState is DataError) {
      emit(MatchError(dataState.error!));
    }
  }
}
