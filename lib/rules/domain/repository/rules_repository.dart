import 'package:seven/rules/domain/entity/rule.dart';

abstract class RulesRepository {
  Future<List<Rule>> getRules();
}
