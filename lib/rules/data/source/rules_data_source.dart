import 'package:seven/rules/data/source/models/rule_response_body.dart';

abstract class RulesDataSource {
  Future<List<RuleResponseBody>> getRules();
}
