import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String? message;
  final String? status;
  final UserModel user;
  final Authorisation authorisation;

  RegisterResponse(
      {this.message,
      this.status,
      required this.user,
      required this.authorisation});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class Authorisation {
  final String token;
  final String type;

  Authorisation({required this.token, required this.type});

  factory Authorisation.fromJson(Map<String, dynamic> json) =>
      _$AuthorisationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorisationToJson(this);
}
