import 'package:seven/dictionary/data/mappers/dictionary_item_mapper.dart';
import 'package:seven/dictionary/data/source/dictionary_data_source.dart';
import 'package:seven/dictionary/domain/entity/dictionary_item.dart';
import 'package:seven/dictionary/domain/repository/dictionary_repository.dart';

class DictionaryRepositoryImpl extends DictionaryRepository {
  final DictionaryDataSource dataSource;
  final DictionaryItemMapper dictionaryItemMapper;

  DictionaryRepositoryImpl({
    required this.dataSource,
    required this.dictionaryItemMapper,
  });

  @override
  Future<List<DictionaryItem>> getVerbs() async {
    final response = await dataSource.getVerbs();

    return response.map((e) => dictionaryItemMapper.mapFromBean(e)).toList();
  }

  @override
  Future<List<DictionaryItem>> getVocabulary() async {
    final response = await dataSource.getVocabulary();

    return response.map((e) => dictionaryItemMapper.mapFromBean(e)).toList();
  }
}
