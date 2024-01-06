import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/home/domain/repos/users_repo.dart';

class GetUseCase implements UseCase<DataState<List<UserEntity>>, void> {
  final UsersRepo repository;

  GetUseCase({required this.repository});

  @override
  Future<DataState<List<UserEntity>>> call({required void params}) async {
    return await repository.get();
  }
}
