import 'package:seven/dictionary/domain/entity/dictionary_item.dart';

abstract class DictionaryRepository {
  Future<List<DictionaryItem>> getVerbs();

  Future<List<DictionaryItem>> getVocabulary();
}
