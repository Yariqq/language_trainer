import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class DeleteQuestionUseCase
    extends BaseFutureUseCase<DeleteQuestionUseCaseParams, void> {
  final RulesRepository repository;

  DeleteQuestionUseCase({required this.repository});

  @override
  Future<void> execute([DeleteQuestionUseCaseParams? input]) {
    return repository.deleteQuestion(
      ruleId: input!.ruleId,
      questionId: input.questionId,
    );
  }
}

class DeleteQuestionUseCaseParams {
  final String ruleId;
  final String questionId;

  const DeleteQuestionUseCaseParams({
    required this.ruleId,
    required this.questionId,
  });
}
