import 'package:seven/dictionary/data/source/models/dictionary_item_response_body.dart';

abstract class DictionaryDataSource {
  Future<List<DictionaryItemResponseBody>> getVerbs();

  Future<List<DictionaryItemResponseBody>> getVocabulary();
}
