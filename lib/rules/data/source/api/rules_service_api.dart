import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seven/rules/data/source/models/create_question_request_body.dart';
import 'package:seven/rules/data/source/models/question_response_body.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';

part 'rules_service_api.g.dart';

@RestApi(baseUrl: 'http://3.94.1.12:8000/')
abstract class RulesServiceApi {
  factory RulesServiceApi(Dio dio, {String baseUrl}) = _RulesServiceApi;

  @GET('api/sections')
  Future<List<RuleResponseBody>> getRules();

  @GET('api/sections/{id}/questions')
  Future<List<QuestionResponseBody>> getQuestions(
    @Path() String id,
  );

  @POST('api/sections/{id}/questions')
  Future<void> createQuestion(
    @Path() String id,
    @Body() CreateQuestionRequestBody body,
  );
}
