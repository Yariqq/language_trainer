import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';
import 'package:seven/rules/data/mappers/question_mapper.dart';
import 'package:seven/rules/data/mappers/question_type_mapper.dart';
import 'package:seven/rules/data/mappers/review_question_model_mapper.dart';
import 'package:seven/rules/data/mappers/rule_mapper.dart';
import 'package:seven/rules/data/repository/rules_repository_impl.dart';
import 'package:seven/rules/data/source/api/rules_service_api.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';
import 'package:seven/rules/data/source/rules_mock_data_source.dart';
import 'package:seven/rules/data/source/rules_remote_data_source.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';
import 'package:seven/rules/domain/usecase/create_question_usecase.dart';
import 'package:seven/rules/domain/usecase/delete_question_usecase.dart';
import 'package:seven/rules/domain/usecase/get_questions_usecase.dart';
import 'package:seven/rules/domain/usecase/get_rules_usecase.dart';
import 'package:seven/rules/domain/usecase/send_to_review_usecase.dart';

class RulesDiModule extends Module {
  @override
  void builder(Scope currentScope) {
    _bindMappers(currentScope);
    _bindDataSources(currentScope);
    _bindRepositories(currentScope);
    _bindUseCases(currentScope);
  }

  void _bindMappers(Scope scope) {
    bind<RuleMapper>().toInstance(RuleMapper());

    bind<QuestionMapper>().toInstance(QuestionMapper());

    bind<QuestionTypeMapper>().toInstance(QuestionTypeMapper());

    bind<ReviewQuestionModelMapper>().toInstance(ReviewQuestionModelMapper());
  }

  void _bindDataSources(Scope scope) {
    bind<RulesDataSource>().toProvide(() {
      if (scope.resolve<bool>(named: 'isMock')) {
        return RulesMockDataSource();
      }

      final baseUrl = scope.resolve<String>(named: 'baseUrl');

      return RulesRemoteDataSource(
        api: RulesServiceApi(
          scope.resolve<Dio>(),
          baseUrl: baseUrl,
        ),
      );
    });
  }

  void _bindRepositories(Scope scope) {
    bind<RulesRepository>().toProvide(
      () => RulesRepositoryImpl(
        dataSource: scope.resolve<RulesDataSource>(),
        ruleMapper: scope.resolve<RuleMapper>(),
        questionMapper: scope.resolve<QuestionMapper>(),
        questionTypeMapper: scope.resolve<QuestionTypeMapper>(),
        reviewQuestionModelMapper: scope.resolve<ReviewQuestionModelMapper>(),
      ),
    );
  }

  void _bindUseCases(Scope scope) {
    bind<GetRulesUseCase>().toProvide(
      () => GetRulesUseCase(
        repository: scope.resolve<RulesRepository>(),
      ),
    );

    bind<GetQuestionsUseCase>().toProvide(
      () => GetQuestionsUseCase(
        repository: scope.resolve<RulesRepository>(),
      ),
    );

    bind<CreateQuestionUseCase>().toProvide(
      () => CreateQuestionUseCase(
        repository: scope.resolve<RulesRepository>(),
      ),
    );

    bind<DeleteQuestionUseCase>().toProvide(
      () => DeleteQuestionUseCase(
        repository: scope.resolve<RulesRepository>(),
      ),
    );

    bind<SendToReviewUseCase>().toProvide(
      () => SendToReviewUseCase(
        repository: scope.resolve<RulesRepository>(),
      ),
    );
  }
}
