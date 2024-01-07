import 'package:json_annotation/json_annotation.dart';

part 'matching_response.g.dart';

@JsonSerializable()
class MatchingResponse {
  final String? message;
  final String? status;

  MatchingResponse({
    this.message,
    this.status,
  });

  factory MatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingResponseToJson(this);
}
