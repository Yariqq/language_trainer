// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_item_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictionaryItemResponseBody _$DictionaryItemResponseBodyFromJson(
        Map<String, dynamic> json) =>
    DictionaryItemResponseBody(
      eng: json['eng'] as String?,
      farsi: json['farsi'] as String?,
      stem: json['stem'] as String?,
      preposition: json['preposition'] as bool?,
    );

Map<String, dynamic> _$DictionaryItemResponseBodyToJson(
        DictionaryItemResponseBody instance) =>
    <String, dynamic>{
      'eng': instance.eng,
      'farsi': instance.farsi,
      'stem': instance.stem,
      'preposition': instance.preposition,
    };
