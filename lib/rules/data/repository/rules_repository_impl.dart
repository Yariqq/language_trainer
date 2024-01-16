import 'package:seven/rules/data/mappers/question_mapper.dart';
import 'package:seven/rules/data/mappers/question_type_mapper.dart';
import 'package:seven/rules/data/mappers/review_question_model_mapper.dart';
import 'package:seven/rules/data/mappers/rule_mapper.dart';
import 'package:seven/rules/data/source/models/create_question_request_body.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';
import 'package:seven/rules/domain/entity/question.dart';
import 'package:seven/rules/domain/entity/question_type.dart';
import 'package:seven/rules/domain/entity/review_question_model.dart';
import 'package:seven/rules/domain/entity/rule.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';

class RulesRepositoryImpl extends RulesRepository {
  final RulesDataSource dataSource;
  final RuleMapper ruleMapper;
  final QuestionMapper questionMapper;
  final QuestionTypeMapper questionTypeMapper;
  final ReviewQuestionModelMapper reviewQuestionModelMapper;

  RulesRepositoryImpl({
    required this.dataSource,
    required this.ruleMapper,
    required this.questionMapper,
    required this.questionTypeMapper,
    required this.reviewQuestionModelMapper,
  });

  @override
  Future<List<Rule>> getRules() async {
    final response = await dataSource.getRules();

    return response.map((e) => ruleMapper.mapFromBean(e)).toList();
  }

  @override
  Future<List<Question>> getQuestions({required String ruleId}) async {
    final response = await dataSource.getQuestions(ruleId: ruleId);

    return response.map((e) => questionMapper.mapFromBean(e)).toList();
  }

  @override
  Future<void> createQuestion({
    QuestionType? type,
    String? content,
    required int ruleId,
  }) {
    return dataSource.createQuestion(
      ruleId: ruleId,
      body: CreateQuestionRequestBody(
        type: questionTypeMapper.mapToBean(type),
        content: content,
      ),
    );
  }

  @override
  Future<void> deleteQuestion({
    required String ruleId,
    required String questionId,
  }) {
    return dataSource.deleteQuestion(ruleId: ruleId, questionId: questionId);
  }

  @override
  Future<void> sendToReview({
    required String ruleId,
    required String questionId,
    required ReviewQuestionModel data,
  }) {
    return dataSource.sendToReview(
      ruleId: ruleId,
      questionId: questionId,
      body: reviewQuestionModelMapper.mapToBean(data),
    );
  }
}
