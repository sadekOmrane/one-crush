part of 'matching_bloc.dart';

@immutable
sealed class MatchingEvent extends Equatable {}

final class Match extends MatchingEvent {
  final int id;
  final String type;
  Match({required this.id, required this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [id, type];
}
