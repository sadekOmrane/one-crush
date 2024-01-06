part of 'get_users_bloc.dart';

@immutable
sealed class GetUsersEvent extends Equatable {}

final class GetUsers extends GetUsersEvent {
  GetUsers();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
