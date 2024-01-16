import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/rules/domain/entity/review_question_model.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class SendToReviewUseCase
    extends BaseFutureUseCase<SendToReviewUseCaseParams, void> {
  final RulesRepository repository;

  SendToReviewUseCase({required this.repository});

  @override
  Future<void> execute([SendToReviewUseCaseParams? input]) {
    return repository.sendToReview(
      ruleId: input!.ruleId,
      questionId: input.questionId,
      data: input.data,
    );
  }
}

class SendToReviewUseCaseParams {
  final String ruleId;
  final String questionId;
  final ReviewQuestionModel data;

  const SendToReviewUseCaseParams({
    required this.ruleId,
    required this.questionId,
    required this.data,
  });
}
