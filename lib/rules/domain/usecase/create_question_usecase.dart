import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/rules/domain/entity/question_type.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class CreateQuestionUseCase
    extends BaseFutureUseCase<CreateQuestionUseCaseParams, void> {
  final RulesRepository repository;

  CreateQuestionUseCase({required this.repository});

  @override
  Future<void> execute([CreateQuestionUseCaseParams? input]) {
    return repository.createQuestion(
      type: input!.type,
      content: input.content,
      ruleId: input.ruleId,
    );
  }
}

class CreateQuestionUseCaseParams {
  final QuestionType? type;
  final String? content;
  final int ruleId;

  const CreateQuestionUseCaseParams({
    this.type,
    this.content,
    required this.ruleId,
  });
}
