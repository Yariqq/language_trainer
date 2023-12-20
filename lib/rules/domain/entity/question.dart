class Question {
  final int id;
  final int ruleId;
  final String content;
  final String gptAnswer;
  final bool forReview;
  final String? userAnswer;
  final String? reviewerAnswer;

  const Question({
    required this.id,
    required this.ruleId,
    required this.content,
    required this.gptAnswer,
    required this.forReview,
    this.userAnswer,
    this.reviewerAnswer,
  });
}
