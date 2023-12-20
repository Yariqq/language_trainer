// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuestionRequestBody _$CreateQuestionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateQuestionRequestBody(
      type: json['type'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$CreateQuestionRequestBodyToJson(
    CreateQuestionRequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('content', instance.content);
  return val;
}
