import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';
import 'package:seven/rules/domain/entity/rule.dart';

class RuleMapper extends BaseMapper<Rule, RuleResponseBody> {
  @override
  Rule mapFromBean(RuleResponseBody src) {
    return Rule(
      id: src.id ?? -1,
      name: src.name ?? '',
    );
  }

  @override
  RuleResponseBody mapToBean(Rule src) {
    return RuleResponseBody(
      id: src.id,
      name: src.name,
    );
  }
}
