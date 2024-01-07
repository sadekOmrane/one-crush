import 'package:mobile/core/network/data_state.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';

abstract class MatchingRepo {
  Future<DataState<void>> match({
    required int id,
    required String type,
  });
}
