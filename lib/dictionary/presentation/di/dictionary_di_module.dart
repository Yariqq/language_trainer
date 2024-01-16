import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';
import 'package:seven/dictionary/data/mappers/dictionary_item_mapper.dart';
import 'package:seven/dictionary/data/repository/dictionary_repository_impl.dart';
import 'package:seven/dictionary/data/source/api/dictionary_service_api.dart';
import 'package:seven/dictionary/data/source/dictionary_data_source.dart';
import 'package:seven/dictionary/data/source/remote_dictionary_data_source.dart';
import 'package:seven/dictionary/domain/repository/dictionary_repository.dart';
import 'package:seven/dictionary/domain/usecase/get_verbs_usecase.dart';
import 'package:seven/dictionary/domain/usecase/get_vocabulary_usecase.dart';

class DictionaryDiModule extends Module {
  @override
  void builder(Scope currentScope) {
    _bindMappers(currentScope);
    _bindDataSources(currentScope);
    _bindRepositories(currentScope);
    _bindUseCases(currentScope);
  }

  void _bindMappers(Scope scope) {
    bind<DictionaryItemMapper>().toInstance(DictionaryItemMapper());
  }

  void _bindDataSources(Scope scope) {
    bind<DictionaryDataSource>().toProvide(() {
      final baseUrl = scope.resolve<String>(named: 'baseUrl');

      return RemoteDictionaryDataSource(
        api: DictionaryServiceApi(
          scope.resolve<Dio>(),
          baseUrl: baseUrl,
        ),
      );
    });
  }

  void _bindRepositories(Scope scope) {
    bind<DictionaryRepository>().toProvide(
      () => DictionaryRepositoryImpl(
        dataSource: scope.resolve<DictionaryDataSource>(),
        dictionaryItemMapper: scope.resolve<DictionaryItemMapper>(),
      ),
    );
  }

  void _bindUseCases(Scope scope) {
    bind<GetVerbsUseCase>().toProvide(
      () => GetVerbsUseCase(
        repository: scope.resolve<DictionaryRepository>(),
      ),
    );

    bind<GetVocabularyUseCase>().toProvide(
      () => GetVocabularyUseCase(
        repository: scope.resolve<DictionaryRepository>(),
      ),
    );
  }
}
