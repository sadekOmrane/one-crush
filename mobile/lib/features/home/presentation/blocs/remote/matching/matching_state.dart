part of 'matching_bloc.dart';

@immutable
sealed class MatchingState extends Equatable {
  final DioException? error;
  MatchingState(this.error);

  @override
  List<Object> get props => [];
}

final class MatchingInitial extends MatchingState {
  MatchingInitial() : super(null);
}

final class MatchLoading extends MatchingState {
  MatchLoading() : super(null);
}

final class MatchLoaded extends MatchingState {
  MatchLoaded() : super(null);
}

final class MatchError extends MatchingState {
  MatchError(DioException error) : super(error);
}
