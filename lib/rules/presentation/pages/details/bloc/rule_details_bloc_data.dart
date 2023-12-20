import 'package:equatable/equatable.dart';
import 'package:seven/rules/domain/entity/question.dart';

class RuleDetailsBlocData extends Equatable {
  final List<Question> questions;
  final String ruleId;

  const RuleDetailsBlocData({
    required this.questions,
    required this.ruleId,
  });

  RuleDetailsBlocData copyWith({
    List<Question>? questions,
    String? ruleId,
  }) {
    return RuleDetailsBlocData(
      questions: questions ?? this.questions,
      ruleId: ruleId ?? this.ruleId,
    );
  }

  const RuleDetailsBlocData.empty() : questions = const [], ruleId = '';

  @override
  List<Object?> get props => [questions, ruleId];
}
