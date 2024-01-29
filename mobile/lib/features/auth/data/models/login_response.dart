import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? message;
  final String? status;
  final Data data;

  LoginResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  final UserModel user;
  final Authorisation authorisation;

  Data({required this.user, required this.authorisation});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
