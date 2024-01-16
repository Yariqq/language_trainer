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

  Question copyWith({
    int? id,
    int? ruleId,
    String? content,
    String? gptAnswer,
    bool? forReview,
    String? userAnswer,
    String? reviewerAnswer,
  }) {
    return Question(
      id: id ?? this.id,
      ruleId: ruleId ?? this.ruleId,
      content: content ?? this.content,
      gptAnswer: gptAnswer ?? this.gptAnswer,
      forReview: forReview ?? this.forReview,
      userAnswer: userAnswer,
      reviewerAnswer: reviewerAnswer,
    );
  }
}
