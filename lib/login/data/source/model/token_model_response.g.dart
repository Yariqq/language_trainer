// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModelResponse _$TokenModelResponseFromJson(Map<String, dynamic> json) =>
    TokenModelResponse(
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
    );

Map<String, dynamic> _$TokenModelResponseToJson(TokenModelResponse instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
