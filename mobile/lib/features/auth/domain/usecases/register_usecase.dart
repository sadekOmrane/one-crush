import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/auth/domain/repos/auth_repo.dart';

class RegisterUseCase
    implements UseCase<DataState<UserEntity>, RegisterParams> {
  final AuthRepo repository;

  RegisterUseCase({required this.repository});

  @override
  Future<DataState<UserEntity>> call({required RegisterParams params}) async {
    return await repository.register(
        email: params.email, password: params.password, name: params.name);
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams(
      {required this.name, required this.email, required this.password});
}
