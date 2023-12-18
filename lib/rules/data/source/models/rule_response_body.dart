import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'rule_response_body.g.dart';

@immutable
@JsonSerializable()
class RuleResponseBody {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;

  const RuleResponseBody({
    required this.id,
    required this.name,
  });

  factory RuleResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RuleResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RuleResponseBodyToJson(this);
}
