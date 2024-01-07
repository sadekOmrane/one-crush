import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/home/domain/repos/matching_repo.dart';

class MatchUseCase implements UseCase<DataState<void>, MatchParams> {
  final MatchingRepo repository;

  MatchUseCase({required this.repository});

  @override
  Future<DataState<void>> call({required MatchParams params}) async {
    return await repository.match(id: params.id, type: params.type);
  }
}

class MatchParams {
  final int id;
  final String type;

  MatchParams({required this.id, required this.type});
}
