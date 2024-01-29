// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      authorisation:
          Authorisation.fromJson(json['authorisation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'authorisation': instance.authorisation,
    };

Authorisation _$AuthorisationFromJson(Map<String, dynamic> json) =>
    Authorisation(
      token: json['token'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AuthorisationToJson(Authorisation instance) =>
    <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
    };
