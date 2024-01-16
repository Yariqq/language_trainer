import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'send_to_review_request_body.g.dart';

@immutable
@JsonSerializable()
class SendToReviewRequestBody {
  @JsonKey(name: 'user_answer')
  final String userAnswer;
  @JsonKey(name: 'reviewer_answer')
  final String? reviewerAnswer;
  @JsonKey(name: 'for_review')
  final bool forReview;

  const SendToReviewRequestBody({
    required this.userAnswer,
    required this.reviewerAnswer,
    required this.forReview,
  });

  factory SendToReviewRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SendToReviewRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SendToReviewRequestBodyToJson(this);
}
