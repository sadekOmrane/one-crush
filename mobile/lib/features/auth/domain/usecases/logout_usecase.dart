import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/auth/domain/repos/auth_repo.dart';

class LogoutUseCase implements UseCase<DataState<void>, void> {
  final AuthRepo repository;

  LogoutUseCase({required this.repository});

  @override
  Future<DataState<void>> call({required void params}) async {
    return await repository.logout();
  }
}
