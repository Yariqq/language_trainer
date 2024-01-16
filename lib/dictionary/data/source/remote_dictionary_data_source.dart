import 'package:seven/dictionary/data/source/api/dictionary_service_api.dart';
import 'package:seven/dictionary/data/source/dictionary_data_source.dart';
import 'package:seven/dictionary/data/source/models/dictionary_item_response_body.dart';

class RemoteDictionaryDataSource extends DictionaryDataSource {
  final DictionaryServiceApi api;

  RemoteDictionaryDataSource({
    required this.api,
  });

  @override
  Future<List<DictionaryItemResponseBody>> getVerbs() {
    return api.getVerbs();
  }

  @override
  Future<List<DictionaryItemResponseBody>> getVocabulary() {
    return api.getVocabulary();
  }
}
