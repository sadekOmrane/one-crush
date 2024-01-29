part of 'get_suggestions_bloc.dart';

@immutable
sealed class GetSuggestionsState extends Equatable {
  final List<UserEntity>? users;
  final DioException? error;
  GetSuggestionsState(this.users, this.error);

  @override
  List<Object> get props => [];
}

final class GetSuggestionsInitial extends GetSuggestionsState {
  GetSuggestionsInitial() : super(null, null);
}

final class GetSuggestionsLoading extends GetSuggestionsState {
  GetSuggestionsLoading() : super(null, null);
}

final class GetSuggestionsLoaded extends GetSuggestionsState {
  GetSuggestionsLoaded(List<UserEntity> users) : super(users, null);
}

final class GetSuggestionsError extends GetSuggestionsState {
  GetSuggestionsError(DioException error) : super(null, error);
}
