import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  final String? message;
  final String? status;
  final List<UserModel> data;

  UsersResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
