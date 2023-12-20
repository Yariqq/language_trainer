// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseBody _$QuestionResponseBodyFromJson(
        Map<String, dynamic> json) =>
    QuestionResponseBody(
      id: json['id'] as int?,
      sectionId: json['section_id'] as int?,
      content: json['content'] as String?,
      gptAnswer: json['gpt_answer'] as String?,
      forReview: json['for_review'] as bool?,
      userAnswer: json['user_answer'] as String?,
      reviewerAnswer: json['reviewer_answer'] as String?,
    );

Map<String, dynamic> _$QuestionResponseBodyToJson(
        QuestionResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section_id': instance.sectionId,
      'content': instance.content,
      'gpt_answer': instance.gptAnswer,
      'for_review': instance.forReview,
      'user_answer': instance.userAnswer,
      'reviewer_answer': instance.reviewerAnswer,
    };
