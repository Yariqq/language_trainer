// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_to_review_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendToReviewRequestBody _$SendToReviewRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SendToReviewRequestBody(
      userAnswer: json['user_answer'] as String,
      reviewerAnswer: json['reviewer_answer'] as String?,
      forReview: json['for_review'] as bool,
    );

Map<String, dynamic> _$SendToReviewRequestBodyToJson(
        SendToReviewRequestBody instance) =>
    <String, dynamic>{
      'user_answer': instance.userAnswer,
      'reviewer_answer': instance.reviewerAnswer,
      'for_review': instance.forReview,
    };
