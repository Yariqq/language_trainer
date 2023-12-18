import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'token_model_response.g.dart';

@immutable
@JsonSerializable()
class TokenModelResponse {
  @JsonKey(name: 'access')
  final String? access;
  @JsonKey(name: 'refresh')
  final String? refresh;

  const TokenModelResponse({
    required this.access,
    required this.refresh,
  });

  factory TokenModelResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelResponseToJson(this);
}
