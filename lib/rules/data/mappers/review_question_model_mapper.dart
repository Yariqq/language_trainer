import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/rules/data/source/models/send_to_review_request_body.dart';
import 'package:seven/rules/domain/entity/review_question_model.dart';

class ReviewQuestionModelMapper
    extends BaseMapper<ReviewQuestionModel, SendToReviewRequestBody> {
  @override
  ReviewQuestionModel mapFromBean(SendToReviewRequestBody src) {
    // TODO: implement mapFromBean
    throw UnimplementedError();
  }

  @override
  SendToReviewRequestBody mapToBean(ReviewQuestionModel src) {
    return SendToReviewRequestBody(
      userAnswer: src.userAnswer,
      reviewerAnswer: src.reviewerAnswer,
      forReview: src.forReview,
    );
  }
}
