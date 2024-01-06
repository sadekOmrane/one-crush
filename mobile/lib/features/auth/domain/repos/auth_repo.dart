import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  });

  Future<DataState<UserEntity>> register({
    required String name,
    required String email,
    required String password,
  });
}
