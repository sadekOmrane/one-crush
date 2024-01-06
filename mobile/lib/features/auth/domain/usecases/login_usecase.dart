import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/auth/domain/repos/auth_repo.dart';

class LoginUseCase implements UseCase<DataState<UserEntity>, LoginParams> {
  final AuthRepo repository;

  LoginUseCase({required this.repository});

  @override
  Future<DataState<UserEntity>> call({required LoginParams params}) async {
    return await repository.login(
        email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
