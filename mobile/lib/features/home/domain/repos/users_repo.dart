import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';

abstract class UsersRepo {
  Future<DataState<List<UserEntity>>> suggestions();
}
