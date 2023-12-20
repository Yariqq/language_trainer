import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'create_question_request_body.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class CreateQuestionRequestBody {
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'content')
  final String? content;

  const CreateQuestionRequestBody({
    required this.type,
    required this.content,
  });

  factory CreateQuestionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateQuestionRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQuestionRequestBodyToJson(this);
}
