import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_request_body.g.dart';

@immutable
@JsonSerializable()
class UserRequestBody {
  @JsonKey(name: 'username')
  final String? name;
  @JsonKey(name: 'password')
  final String? password;

  const UserRequestBody({
    required this.name,
    required this.password,
  });

  factory UserRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UserRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestBodyToJson(this);
}
