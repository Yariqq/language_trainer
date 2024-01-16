import 'package:seven/rules/data/source/api/rules_service_api.dart';
import 'package:seven/rules/data/source/models/create_question_request_body.dart';
import 'package:seven/rules/data/source/models/question_response_body.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';
import 'package:seven/rules/data/source/models/send_to_review_request_body.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';

class RulesRemoteDataSource extends RulesDataSource {
  final RulesServiceApi api;

  RulesRemoteDataSource({required this.api});

  @override
  Future<List<RuleResponseBody>> getRules() {
    return api.getRules();
  }

  @override
  Future<List<QuestionResponseBody>> getQuestions({required String ruleId}) {
    return api.getQuestions(ruleId);
  }

  @override
  Future<void> createQuestion({
    required int ruleId,
    required CreateQuestionRequestBody body,
  }) {
    return api.createQuestion(ruleId.toString(), body);
  }

  @override
  Future<void> deleteQuestion({
    required String ruleId,
    required String questionId,
  }) {
    return api.deleteQuestion(ruleId, questionId);
  }

  @override
  Future<void> sendToReview({
    required String ruleId,
    required String questionId,
    required SendToReviewRequestBody body,
  }) {
    return api.sendToReview(ruleId, questionId, body);
  }
}
