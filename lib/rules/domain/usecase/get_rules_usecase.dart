import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/rules/domain/entity/rule.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class GetRulesUseCase extends BaseFutureUseCase<void, List<Rule>> {
  final RulesRepository repository;

  GetRulesUseCase({required this.repository});

  @override
  Future<List<Rule>> execute([void input]) {
    return repository.getRules();
  }
}
