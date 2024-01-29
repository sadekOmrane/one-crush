part of 'get_suggestions_bloc.dart';

@immutable
sealed class GetSuggestionsEvent extends Equatable {}

final class GetSuggestions extends GetSuggestionsEvent {
  GetSuggestions();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
