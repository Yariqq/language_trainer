import 'package:seven/rules/data/source/models/create_question_request_body.dart';
import 'package:seven/rules/data/source/models/question_response_body.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';

abstract class RulesDataSource {
  Future<List<RuleResponseBody>> getRules();

  Future<List<QuestionResponseBody>> getQuestions({required String ruleId});

  Future<void> createQuestion({
    required int ruleId,
    required CreateQuestionRequestBody body,
  });
}
