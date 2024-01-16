import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seven/dictionary/data/source/models/dictionary_item_response_body.dart';

part 'dictionary_service_api.g.dart';

@RestApi(baseUrl: 'http://3.94.1.12:8000/')
abstract class DictionaryServiceApi {
  factory DictionaryServiceApi(Dio dio, {String baseUrl}) =
      _DictionaryServiceApi;

  @GET('api/dictionary/verbs')
  Future<List<DictionaryItemResponseBody>> getVerbs();

  @GET('api/dictionary/vocabulary')
  Future<List<DictionaryItemResponseBody>> getVocabulary();
}
