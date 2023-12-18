import 'package:seven/rules/data/source/api/rules_service_api.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';

class RulesRemoteDataSource extends RulesDataSource {
  final RulesServiceApi api;

  RulesRemoteDataSource({required this.api});

  @override
  Future<List<RuleResponseBody>> getRules() {
    return api.getRules();
  }
}
