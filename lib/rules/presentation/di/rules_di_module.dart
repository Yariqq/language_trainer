import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';
import 'package:seven/rules/data/mappers/rule_mapper.dart';
import 'package:seven/rules/data/repository/rules_repository_impl.dart';
import 'package:seven/rules/data/source/api/rules_service_api.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';
import 'package:seven/rules/data/source/rules_mock_data_source.dart';
import 'package:seven/rules/data/source/rules_remote_data_source.dart';
import 'package:seven/rules/domain/repository/rules_repository.dart';
import 'package:seven/rules/domain/usecase/get_rules_usecase.dart';

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
      ),
    );
  }

  void _bindUseCases(Scope scope) {
    bind<GetRulesUseCase>().toProvide(
      () => GetRulesUseCase(
        repository: scope.resolve<RulesRepository>(),
      ),
    );
  }
}
