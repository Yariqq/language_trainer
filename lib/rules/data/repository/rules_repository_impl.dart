import 'package:seven/rules/data/mappers/rule_mapper.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';
import 'package:seven/rules/domain/entity/rule.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class RulesRepositoryImpl extends RulesRepository {
  final RulesDataSource dataSource;
  final RuleMapper ruleMapper;

  RulesRepositoryImpl({
    required this.dataSource,
    required this.ruleMapper,
  });

  @override
  Future<List<Rule>> getRules() async {
    final response = await dataSource.getRules();

    return response.map((e) => ruleMapper.mapFromBean(e)).toList();
  }
}
