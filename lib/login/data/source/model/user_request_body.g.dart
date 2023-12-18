// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestBody _$UserRequestBodyFromJson(Map<String, dynamic> json) =>
    UserRequestBody(
      name: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserRequestBodyToJson(UserRequestBody instance) =>
    <String, dynamic>{
      'username': instance.name,
      'password': instance.password,
    };
