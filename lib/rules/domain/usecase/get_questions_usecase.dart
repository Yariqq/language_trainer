import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/rules/domain/entity/question.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class GetQuestionsUseCase extends BaseFutureUseCase<String, List<Question>> {
  final RulesRepository repository;

  GetQuestionsUseCase({required this.repository});

  @override
  Future<List<Question>> execute([String? input]) {
    return repository.getQuestions(ruleId: input!);
  }
}
