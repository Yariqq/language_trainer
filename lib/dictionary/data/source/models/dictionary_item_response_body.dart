import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'dictionary_item_response_body.g.dart';

@immutable
@JsonSerializable()
class DictionaryItemResponseBody {
  @JsonKey(name: 'eng')
  final String? eng;
  @JsonKey(name: 'farsi')
  final String? farsi;
  @JsonKey(name: 'stem')
  final String? stem;
  @JsonKey(name: 'preposition')
  final bool? preposition;

  const DictionaryItemResponseBody({
    required this.eng,
    required this.farsi,
    required this.stem,
    required this.preposition,
  });

  factory DictionaryItemResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DictionaryItemResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryItemResponseBodyToJson(this);
}
