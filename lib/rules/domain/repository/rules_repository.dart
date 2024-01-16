import 'package:seven/rules/domain/entity/question.dart';
import 'package:seven/rules/domain/entity/question_type.dart';
import 'package:seven/rules/domain/entity/review_question_model.dart';
import 'package:seven/rules/domain/entity/rule.dart';

abstract class RulesRepository {
  Future<List<Rule>> getRules();

  Future<List<Question>> getQuestions({required String ruleId});

  Future<void> createQuestion({
    QuestionType? type,
    String? content,
    required int ruleId,
  });

  Future<void> deleteQuestion({
    required String ruleId,
    required String questionId,
  });

  Future<void> sendToReview({
    required String ruleId,
    required String questionId,
    required ReviewQuestionModel data,
  });
}
