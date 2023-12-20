import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'question_response_body.g.dart';

@immutable
@JsonSerializable()
class QuestionResponseBody {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'section_id')
  final int? sectionId;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'gpt_answer')
  final String? gptAnswer;
  @JsonKey(name: 'for_review')
  final bool? forReview;
  @JsonKey(name: 'user_answer')
  final String? userAnswer;
  @JsonKey(name: 'reviewer_answer')
  final String? reviewerAnswer;

  const QuestionResponseBody({
    required this.id,
    required this.sectionId,
    required this.content,
    required this.gptAnswer,
    required this.forReview,
    required this.userAnswer,
    required this.reviewerAnswer,
  });

  factory QuestionResponseBody.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseBodyToJson(this);
}
