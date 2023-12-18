import 'package:equatable/equatable.dart';
import 'package:seven/rules/domain/entity/rule.dart';

class RulesListBlocData extends Equatable {
  final List<Rule> rules;

  const RulesListBlocData({
    required this.rules,
  });

  RulesListBlocData copyWith({List<Rule>? rules}) {
    return RulesListBlocData(
      rules: rules ?? this.rules,
    );
  }

  RulesListBlocData.empty() : rules = [];

  @override
  List<Object?> get props => [rules];
}
