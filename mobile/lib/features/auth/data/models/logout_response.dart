import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  final String? message;
  final String? status;

  LogoutResponse({
    this.message,
    this.status,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
