import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:seven/rules/data/source/models/create_question_request_body.dart';
import 'package:seven/rules/data/source/models/question_response_body.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';
import 'package:seven/rules/data/source/models/send_to_review_request_body.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';

const _loadingDuration = Duration(milliseconds: 1000);

class RulesMockDataSource extends RulesDataSource {
  @override
  Future<List<RuleResponseBody>> getRules() async {
    const path = 'assets/mock/rules.json';
    await Future.delayed(_loadingDuration);

    final response =
        jsonDecode(await rootBundle.loadString(path)) as List<dynamic>;

    return response.map((e) => RuleResponseBody.fromJson(e)).toList();
  }

  @override
  Future<List<QuestionResponseBody>> getQuestions(
      {required String ruleId}) async {
    const path = 'assets/mock/questions.json';
    await Future.delayed(_loadingDuration);

    final response =
        jsonDecode(await rootBundle.loadString(path)) as List<dynamic>;

    return response.map((e) => QuestionResponseBody.fromJson(e)).toList();
  }

  @override
  Future<void> createQuestion({
    required int ruleId,
    required CreateQuestionRequestBody body,
  }) {
    return Future.value();
  }

  @override
  Future<void> deleteQuestion({
    required String ruleId,
    required String questionId,
  }) {
    return Future.value();
  }

  @override
  Future<void> sendToReview({
    required String ruleId,
    required String questionId,
    required SendToReviewRequestBody body,
  }) {
    return Future.value();
  }
}
