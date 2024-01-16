class ReviewQuestionModel {
  final String userAnswer;
  final String? reviewerAnswer;
  final bool forReview;

  const ReviewQuestionModel({
    required this.userAnswer,
    this.reviewerAnswer,
    required this.forReview,
  });
}
